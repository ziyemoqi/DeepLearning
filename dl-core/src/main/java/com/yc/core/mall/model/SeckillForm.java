package com.yc.core.mall.model;

import lombok.Data;

/**
 * 功能描述:秒杀form
 *
 * @Author: xieyc
 * @Date: 2020-06-08
 * @Version: 1.0.0
 */
@Data
public class SeckillForm {

    /**
     * 凭证
     */
    private String md5;

    /**
     * 秒杀项目
     */
    private String mallSeckillId;

    /**
     * 执行时间
     */
    private String killTime;

}
