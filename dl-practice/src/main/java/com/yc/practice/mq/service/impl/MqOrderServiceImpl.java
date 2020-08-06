package com.yc.practice.mq.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.yc.common.constant.CommonConstant;
import com.yc.common.constant.CommonEnum;
import com.yc.common.global.error.Error;
import com.yc.common.global.error.ErrorException;
import com.yc.core.mall.entity.*;
import com.yc.core.mall.mapper.*;
import com.yc.core.mq.model.MqOrderFrom;
import com.yc.core.mq.model.MqOrderProductFORM;
import com.yc.core.system.entity.SysUser;
import com.yc.core.system.entity.UserBalanceLog;
import com.yc.core.system.mapper.SysUserMapper;
import com.yc.core.system.mapper.UserBalanceLogMapper;
import com.yc.practice.mall.service.MallOrderItemService;
import com.yc.practice.mq.service.MqOrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 功能描述: 订单实现层
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-07-30
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class MqOrderServiceImpl implements MqOrderService {

    private final RedisTemplate redisTemplate;
    private final SysUserMapper sysUserMapper;
    private final MallOrderMapper mallOrderMapper;
    private final MallCouponMapper mallCouponMapper;
    private final MallProductMapper mallProductMapper;
    private final MallOrderLogMapper mallOrderLogMapper;
    private final MallShippingMapper mallShippingMapper;
    private final UserBalanceLogMapper userBalanceLogMapper;
    private final MallOrderItemService mallOrderItemService;

    @Override
    public void confirmOrder(MqOrderFrom form) {
        // 1.校验订单
        this.checkOrder(form);
        // 2.生成预订单
        String orderId = this.savePreOrder(form);
        try {
            //3.扣减库存
            this.reduceProductStock(form);
            //4.扣减优惠券
            this.updateCouponState(form.getMallCouponId(),orderId);
            //5.扣减余额
            if (form.getBalance().compareTo(BigDecimal.valueOf(0)) > 0) {
                this.reduceBalance(form.getSysUserId(), form.getBalance(), orderId);
            }
            // 6.确认订单
            this.updateOrderState(orderId, form.getSysUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // ************************** 子方法 *******************

    /**
     * 确认订单
     *
     * @param orderId   订单ID
     * @param sysUserId 用户ID
     */
    private void updateOrderState(String orderId, String sysUserId) {
        int result = mallOrderMapper.update(null, Wrappers.<MallOrder>lambdaUpdate()
                .eq(MallOrder::getMallOrderId, orderId)
                .set(MallOrder::getState, CommonEnum.OrderState.ORDER_STATE_10.getCode())
        );
        if (result < 1) {
            throw new ErrorException(Error.ServiceError);
        }
        MallOrderLog mallOrderLog = new MallOrderLog();
        mallOrderLog.setMallOrderId(orderId);
        mallOrderLog.setState(CommonEnum.OrderState.ORDER_STATE_10.getCode());
        mallOrderLog.setRemark("确认订单");
        mallOrderLog.setCreateUserId(sysUserId);
        mallOrderLogMapper.insert(mallOrderLog);
    }

    /**
     * 扣减余额
     *
     * @param sysUserId 用户ID
     * @param balance   扣减余额
     * @param orderId   订单ID
     */
    private void reduceBalance(String sysUserId, BigDecimal balance, String orderId) {
        int result = sysUserMapper.reduceBalance(sysUserId, balance);
        if (result < 1) {
            throw new ErrorException(Error.AmountError);
        }
        // 记录用户余额变动
        UserBalanceLog userBalanceLog = new UserBalanceLog();
        userBalanceLog.setSysUserId(sysUserId);
        userBalanceLog.setOrderId(orderId);
        userBalanceLog.setAmountLogType(1);
        userBalanceLog.setAmount(balance);
        userBalanceLogMapper.insert(userBalanceLog);
    }

    /**
     * 扣减优惠券
     *
     * @param mallCouponId 优惠券
     */
    private void updateCouponState(String mallCouponId,String orderId) {
        mallCouponMapper.update(null, Wrappers.<MallCoupon>lambdaUpdate()
                .eq(MallCoupon::getMallCouponId, mallCouponId)
                .set(MallCoupon::getIsUsed, true)
                .set(MallCoupon::getMallOrderId,orderId)
                .set(MallCoupon::getUsedTime, LocalDateTime.now())
        );
    }

    /**
     * 扣减库存
     *
     * @param form 订单信息
     */
    private void reduceProductStock(MqOrderFrom form) {
        form.getProductList().forEach(item -> {
            int result = mallProductMapper.reduceProductStock(item.getProductId(), item.getBuyNum());
            if (result < 1) {
                throw new ErrorException(Error.StockLow);
            }
        });
    }

    /**
     * 生成预订单
     *
     * @param form 订单信息
     * @return 订单ID
     */
    private String savePreOrder(MqOrderFrom form) {
        // 订单信息@a
        MallOrder mallOrder = new MallOrder();
        String orderNo = generateOrderNo();
        mallOrder.setOrderNo(orderNo);
        mallOrder.setTotalAmount(form.getTotalAmount());
        mallOrder.setPayAmount(form.getPayAmount());
        mallOrder.setState(CommonEnum.OrderState.ORDER_STATE_5.getCode());
        mallOrder.setOrderType(0);
        // 收货地址@b
        MallShipping mallShipping = mallShippingMapper.selectById(form.getMallShippingId());
        mallOrder.setReceiverName(mallShipping.getReceiverName());
        mallOrder.setReceiverPhone(mallShipping.getReceiverPhone());
        mallOrder.setReceiverProvince(mallShipping.getReceiverProvince());
        mallOrder.setReceiverCity(mallShipping.getReceiverCity());
        mallOrder.setReceiverArea(mallShipping.getReceiverArea());
        mallOrder.setRegionCode(mallShipping.getRegionCode());
        mallOrder.setReceiverAddress(mallShipping.getReceiverAddress());
        // 优惠券@b
        if (StringUtils.isNotBlank(form.getMallCouponId())) {
            mallOrder.setMallCouponId(form.getMallCouponId());
            mallOrder.setMallCouponMoney(form.getMallCouponMoney());
        }
        mallOrder.setUseBalance(form.getBalance());
        mallOrder.setCreateUserId(form.getSysUserId());
        mallOrderMapper.insert(mallOrder);
        // 订单详情@a
        List<MallOrderItem> orderItemList = new ArrayList<>();
        for (int i = 0; i < form.getProductList().size(); i++) {
            MallOrderItem mallOrderItem = new MallOrderItem();
            MqOrderProductFORM itemProduct = form.getProductList().get(i);
            mallOrderItem.setSysUserId(form.getSysUserId());
            mallOrderItem.setMallOrderId(mallOrder.getMallOrderId());
            mallOrderItem.setOrderNo(orderNo);
            mallOrderItem.setProductId(itemProduct.getProductId());
            MallProduct mallProduct = mallProductMapper.selectById(itemProduct.getProductId());
            mallOrderItem.setProductName(mallProduct.getName());
            mallOrderItem.setProductPic(mallProduct.getPic());
            mallOrderItem.setProductPrice(mallProduct.getPrice());
            mallOrderItem.setProductNum(itemProduct.getBuyNum());
            orderItemList.add(mallOrderItem);
        }
        mallOrderItemService.saveBatch(orderItemList);
        // 订单日志
        MallOrderLog mallOrderLog = new MallOrderLog();
        mallOrderLog.setMallOrderId(mallOrder.getMallOrderId());
        mallOrderLog.setState(CommonEnum.OrderState.ORDER_STATE_5.getCode());
        mallOrderLog.setRemark("生成预订单");
        mallOrderLog.setCreateUserId(form.getSysUserId());
        mallOrderLogMapper.insert(mallOrderLog);
        return mallOrder.getMallOrderId();
    }

    /**
     * 生成唯一订单号
     *
     * @return 23位订单号[当前时间(毫秒) + 自增id]
     */
    private String generateOrderNo() {
        StringBuilder sb = new StringBuilder();
        Long nowLong = Long.parseLong(new SimpleDateFormat(CommonConstant.yyyyMMddHHmmssSSS).format(new Date()));
        sb.append(nowLong.toString());
        String date = new SimpleDateFormat(CommonConstant.yyyyMMddHHmm).format(new Date());
        String key = CommonConstant.TODAY_ORDER_NO + date;
        if (!redisTemplate.hasKey(key)) {
            redisTemplate.opsForValue().set(key, 0, 5, TimeUnit.MINUTES);
        }
        Long increment = redisTemplate.opsForValue().increment(key, 1);
        String incrementStr = increment.toString();
        if (incrementStr.length() <= 6) {
            sb.append(String.format("%06d", increment));
        } else {
            sb.append(incrementStr);
        }
        return sb.toString();
    }

    /**
     * 校验订单
     *
     * @param form 订单信息
     */
    private void checkOrder(MqOrderFrom form) {
        // 1.校验下单用户是否存在
        SysUser sysUser = sysUserMapper.selectById(form.getSysUserId());
        if (ObjectUtil.isNull(sysUser)) {
            throw new ErrorException(Error.UserNotFound);
        }
        // 2.校验余额
        if (form.getBalance().compareTo(sysUser.getBalance()) == 1) {
            throw new ErrorException(Error.AmountError);
        }
        // 3.校验优惠券
        BigDecimal couponAmount = BigDecimal.valueOf(0);
        if (StringUtils.isNotBlank(form.getMallCouponId())) {
            MallCoupon mallCoupon = mallCouponMapper.selectOne(Wrappers.<MallCoupon>lambdaQuery()
                    .eq(MallCoupon::getMallCouponId, form.getMallCouponId())
                    .eq(MallCoupon::getIsUsed, false)
                    .eq(MallCoupon::getSysUserId, form.getSysUserId())
            );
            if (ObjectUtil.isNull(mallCoupon)) {
                throw new ErrorException(Error.ParameterNotFound);
            }
            couponAmount = mallCoupon.getAmount();
            form.setMallCouponMoney(couponAmount);
        }
        // 3.校验商品
        BigDecimal productAmount = BigDecimal.valueOf(0);
        for (int i = 0; i < form.getProductList().size(); i++) {
            MqOrderProductFORM product = form.getProductList().get(i);
            // 1.校验商品是否存在
            MallProduct mallProduct = mallProductMapper.selectById(product.getProductId());
            if (ObjectUtil.isNull(mallProduct)) {
                throw new ErrorException(Error.GoodError);
            }
            // 2.校验库存
            if (product.getBuyNum() > mallProduct.getStock()) {
                throw new ErrorException(Error.StockLow);
            }
            productAmount = productAmount.add(mallProduct.getPrice().multiply(BigDecimal.valueOf(product.getBuyNum())));
        }
        form.setTotalAmount(productAmount);
        // 4.校验支付金额(向下取整)
        BigDecimal localAmount = (productAmount.subtract(form.getBalance()).subtract(couponAmount)).setScale(2, BigDecimal.ROUND_DOWN);
        if (form.getPayAmount().compareTo(localAmount) != 0) {
            throw new ErrorException(Error.AmountError);
        }
        log.info("**** 订单校验通过 ****");
    }

}
