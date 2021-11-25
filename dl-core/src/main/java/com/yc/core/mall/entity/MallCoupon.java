package com.yc.core.mall.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 功能描述: 优惠券
 *
 * @Author xieyc
 * @Date 2021-11-24
 * @Version: 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class MallCoupon implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 优惠券ID
     */
    @TableId(value = "mall_coupon_id", type = IdType.ASSIGN_UUID)
    private String mallCouponId;
    /**
     * 优惠券金额
     */
    private BigDecimal amount;
    /**
     * 用户ID
     */
    private String sysUserId;
    /**
     * 订单ID
     */
    private String mallOrderId;
    /**
     * 是否使用 0未使用 1已使用
     */
    private Boolean isUsed;
    /**
     * 使用时间
     */
    private LocalDateTime usedTime;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;



}
