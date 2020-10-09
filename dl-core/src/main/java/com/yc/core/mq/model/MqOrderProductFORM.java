package com.yc.core.mq.model;

import lombok.Data;

/**
 * 功能描述: 订单商品FORM
 *
 * @Author: xieyc
 * @Date: 2020-08-02
 */
@Data
public class MqOrderProductFORM {

    /**
     * 购买商品
     */
    private String productId;
    /**
     * 购买数量
     */
    private Integer buyNum;
}
