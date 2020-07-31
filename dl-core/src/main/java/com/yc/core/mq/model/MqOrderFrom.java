package com.yc.core.mq.model;

import com.yc.core.mall.entity.MallProduct;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 功能描述: 订单提交FORM
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-07-30
 */
@Data
public class MqOrderFrom {

    /**
     * 商品信息
     */
    private List<OrderProduct> productList;
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
     * 商品信息
     */
    @Data
    public class OrderProduct {
        /**
         * 购买商品
         */
        private String productId;
        /**
         * 购买数量
         */
        private Integer buyNum;
    }
}
