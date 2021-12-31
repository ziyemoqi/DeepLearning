package com.yc.core.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-06-05
 * @Version: 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SeckillVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 凭证
     */
    private String md5;

    /**
     * 系统当前时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime localDateTime;

    /**
     * 状态(0:未开始 1:开始秒杀 2:已结束)
     */
    private String state;

    /**
     * 秒杀开启时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime seckillStartTime;
    /**
     * 秒杀结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime seckillEndTime;

    /**
     * 商品名称
     */
    private String mallProductName;

}
