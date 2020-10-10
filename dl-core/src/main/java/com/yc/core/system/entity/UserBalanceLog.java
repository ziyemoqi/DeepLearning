package com.yc.core.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 功能描述: 用户余额变动记录
 *
 * @Author xieyc
 * @Date: 2020-07-27
 * @Version: 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserBalanceLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "user_balance_log", type = IdType.ASSIGN_UUID)
    private String userBalanceLog;

    /**
     * 用户ID
     */
    private String sysUserId;

    /**
     * 订单ID
     */
    private String orderId;

    /**
     * 日志类型 1订单付款 2 订单退款
     */
    private Integer amountLogType;

    /**
     * 变动金额
     */
    private BigDecimal amount;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;


}
