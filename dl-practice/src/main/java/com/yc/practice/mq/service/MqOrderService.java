package com.yc.practice.mq.service;

import com.yc.core.mq.model.MqOrderFrom;

/**
 * 功能描述: mq订单接口
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-07-30
 */
public interface MqOrderService {

    /**
     * 确认订单
     *
     * @param form 订单信息
     */
    void confirmOrder(MqOrderFrom form);
}
