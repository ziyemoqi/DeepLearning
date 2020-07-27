package com.yc.practice;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 砍价参与
 * </p>
 *
 * @author xieyc
 * @date 2020-07-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class BarginJoin implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 砍价参与ID
     */
    @TableId(value = "bargin_join_id", type = IdType.ASSIGN_UUID)
    private String barginJoinId;
    /**
     * 砍价活动ID
     */
    private String barginActivityId;
    /**
     * 所属店铺ID
     */
    private String shopId;
    /**
     * 砍价订单ID
     */
    private String orderInfoId;
    /**
     * 参与用户ID
     */
    private String userId;
    /**
     * 商品ID
     */
    private String productId;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品SKUID
     */
    private String productSkuId;
    /**
     * 商品SKU名称
     */
    private String productSkuName;
    /**
     * 商品主图
     */
    private String productMainPic;
    /**
     * 商品价格
     */
    private BigDecimal price;
    /**
     * 零售价
     */
    private BigDecimal weight;
    /**
     * 应砍金额
     */
    private BigDecimal totalAmount;
    /**
     * 已砍金额
     */
    private BigDecimal finishAmount;
    /**
     * 砍价状态2.10
     */
    private Integer state;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;


}
