package com.yc.core.system.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 功能描述: 日志数据DTO
 *
 * @Author: xieyc
 * @Date: 2021-12-31
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SysLogDto {

    /**
     * 操作类型(0:增 1：删  2：改 3：查)
     */
    private Integer opType;
    /**
     * 日志类型(0.操作日志 1.登录登出日志 2.定时任务）
     */
    private Integer logType;
    /**
     * 请求方法
     */
    private String requestMethod;
    /**
     * 请求路径
     */
    private String requestUrl;
    /**
     * 请求参数
     */
    private String requestParam;
    /**
     * 请求类型
     */
    private String requestType;
    /**
     * 耗时
     */
    private Long costTime;
}
