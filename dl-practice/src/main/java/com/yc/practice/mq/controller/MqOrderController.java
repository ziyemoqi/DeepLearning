package com.yc.practice.mq.controller;

import com.yc.core.mq.model.MqOrderFrom;
import com.yc.practice.mq.service.MqOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 功能描述: 订单控制层
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-07-30
 */
@RestController
@RequestMapping("/mqOrder")
public class MqOrderController {

    private final MqOrderService orderService;

    @Autowired
    public MqOrderController(MqOrderService orderService) {
        this.orderService = orderService;
    }

    /**
     * 确认订单
     * @param form 订单信息
     */
    @PostMapping("/confirmOrder")
    public void confirmOrder(@RequestBody MqOrderFrom form) {
        orderService.confirmOrder(form);
    }

}
