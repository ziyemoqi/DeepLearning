package com.yc.practice.mall.service.impl;

import com.yc.core.mall.entity.MallCoupon;
import com.yc.core.mall.mapper.MallCouponMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.practice.mall.service.MallCouponService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* 功能描述:
*
* @Author xieyc && 紫色年华
* @Date 2020-07-27
* @Version: 1.0.0
*/
@Service
@Transactional(rollbackFor = Exception.class)
public class MallCouponServiceImpl extends ServiceImpl<MallCouponMapper, MallCoupon> implements MallCouponService {

}
