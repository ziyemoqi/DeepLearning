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
 * 砍价活动
 * </p>
 *
 * @author xieyc
 * @date 2020-07-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class BarginActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 砍价活动ID
     */
    @TableId(value = "bargin_activity_id", type = IdType.ASSIGN_UUID)
    private String barginActivityId;
    /**
     * 所属店铺ID
     */
    private String shopId;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 活动商品ID
     */
    private String productId;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品主图
     */
    private String productMainPic;
    /**
     * 活动商品库存
     */
    private Integer activityStock;
    /**
     * 砍价最低价
     */
    private BigDecimal minPrice;
    /**
     * 开始时间
     */
    private LocalDateTime beginTime;
    /**
     * 结束时间
     */
    private LocalDateTime endTime;
    /**
     * 砍价有效期
     */
    private Integer validHour;
    /**
     * 帮砍金额规则(0:随机 1:固定)
     */
    private Integer helpAmountType;
    /**
     * 帮砍人数
     */
    private Integer helpPeopleNumber;
    /**
     * 购买设置2.9
     */
    private Integer buyType;
    /**
     * 发起砍价次数
     */
    private Integer barginLimitNumber;
    /**
     * 帮砍次数
     */
    private Integer helpNumber;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;


}
