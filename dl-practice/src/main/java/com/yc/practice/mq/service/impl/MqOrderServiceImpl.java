package com.yc.practice.mq.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.yc.common.constant.CommonConstant;
import com.yc.common.constant.CommonEnum;
import com.yc.common.global.error.Error;
import com.yc.common.global.error.ErrorException;
import com.yc.core.mall.entity.MallCoupon;
import com.yc.core.mall.entity.MallOrder;
import com.yc.core.mall.entity.MallProduct;
import com.yc.core.mall.mapper.MallCouponMapper;
import com.yc.core.mall.mapper.MallProductMapper;
import com.yc.core.mq.model.MqOrderFrom;
import com.yc.core.system.entity.SysUser;
import com.yc.core.system.mapper.SysUserMapper;
import com.yc.practice.mq.service.MqOrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    private final SysUserMapper sysUserMapper;
    private final RedisTemplate redisTemplate;
    private final MallCouponMapper mallCouponMapper;
    private final MallProductMapper mallProductMapper;

    @Override
    public void confirmOrder(MqOrderFrom form) {
        // 1.校验订单
        this.checkOrder(form);
        // 2.生成预订单
        this.savePreOrder(form);
        //3.扣减库存
        // reduceGoodsNum(order);
        //4.扣减优惠券
        // updateCouponStatus(order);
        //5.使用余额
        // reduceMoneyPaid(order);
    }


    // ************************** 子方法 *******************

    /**
     * 生成预订单
     *
     * @param form 订单信息
     */
    private void savePreOrder(MqOrderFrom form) {
        // MallOrder mallOrder = new MallOrder();
        // mallOrder.setOrderNo(generateOrderNo());
        // mallOrder.setTotalAmount();
        // mallOrder.setPayAmount();
        // mallOrder.setPostage();
        // mallOrder.setPayType();
        // mallOrder.setState(CommonEnum.OrderState.ORDER_STATE_5.getCode());
        // mallOrder.setOrderType();
        // mallOrder.setReceiverName();
        // mallOrder.setReceiverPhone();
        // mallOrder.setReceiverProvince();
        // mallOrder.setReceiverCity();
        // mallOrder.setReceiverArea();
        // mallOrder.setRegionCode();
        // mallOrder.setReceiverAddress();
        // mallOrder.setConfirmState();
        // mallOrder.setConfirmTime();
        // mallOrder.setMallCouponId();
        // mallOrder.setMallCouponMoney();
        // mallOrder.setPayTime();
        // mallOrder.setSendTime();
        // mallOrder.setEndTime();
        // mallOrder.setCloseTime();
        // mallOrder.setCreateUserId(form.getSysUserId());
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
        }
        // 3.校验商品
        BigDecimal productAmount = BigDecimal.valueOf(0);
        for (int i = 0; i < form.getProductList().size(); i++) {
            MqOrderFrom.OrderProduct product = form.getProductList().get(i);
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
        // 4.校验支付金额(向下取整)
        BigDecimal localAmount = (productAmount.subtract(form.getBalance()).subtract(couponAmount)).setScale(2, BigDecimal.ROUND_DOWN);
        if (form.getPayAmount().compareTo(localAmount) != 0) {
            throw new ErrorException(Error.AmountError);
        }
        log.info("**** 订单校验通过 ****");
    }

}
