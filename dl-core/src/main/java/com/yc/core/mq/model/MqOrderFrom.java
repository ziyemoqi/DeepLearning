package com.yc.core.mq.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 功能描述: 订单提交FORM
 *
 * @Author: xieyc
 * @Date: 2020-07-30
 */
@Data
public class MqOrderFrom {

    /**
     * 商品信息
     */
    private List<MqOrderProductFORM> productList;
    /**
     * 用户ID
     */
    private String sysUserId;
    /**
     * 支付金额
     */
    private BigDecimal payAmount;
    /**
     * 优惠券ID
     */
    private String mallCouponId;
    /**
     * 余额
     */
    private BigDecimal balance;
    /**
     * 收货地址
     */
    private String mallShippingId;

    // *********** 本地赋值字段 *************
    /**
     * 订单总金额
     */
    private BigDecimal totalAmount;
    /**
     * 优惠券金额
     */
    private BigDecimal mallCouponMoney;
}
