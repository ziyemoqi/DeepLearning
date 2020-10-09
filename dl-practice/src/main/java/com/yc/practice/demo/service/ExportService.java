package com.yc.practice.demo.service;

import javax.servlet.http.HttpServletResponse;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-02-16
 * @Version: 1.0.0
 */
public interface ExportService {

    /**
     * 导出word
     *
     * @param response 响应
     */
    void export(HttpServletResponse response);
}
