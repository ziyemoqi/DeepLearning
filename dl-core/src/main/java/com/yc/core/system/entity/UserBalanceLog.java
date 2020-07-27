package com.yc.core.system.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 功能描述:
 *
 * @Author xieyc && 紫色年华
 * @Date 2020-07-27
 * @Version: 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UserBalanceLog implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 用户ID
     */
    @TableId(value = "user_id", type = IdType.ASSIGN_UUID)
    private String userId;
    /**
     * 订单ID
     */
    private String orderId;
    /**
     * 日志类型 1订单付款 2 订单退款
     */
    private Integer moneyLogType;
    private BigDecimal useMoney;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;



}
