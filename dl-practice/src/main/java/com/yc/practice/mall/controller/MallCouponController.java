package com.yc.practice.mall.controller;

import com.yc.practice.mall.service.MallCouponService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 功能描述:
 *
 * @Author xieyc && 紫色年华
 * @Date 2020-07-27
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/mall/mall-coupon")
@Slf4j
public class MallCouponController {

    @Autowired
    public MallCouponService iMallCouponService;

}
