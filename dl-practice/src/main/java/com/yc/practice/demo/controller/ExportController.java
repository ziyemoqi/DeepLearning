package com.yc.practice.demo.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yc.common.constant.CommonEnum;
import com.yc.common.utils.JxlsOutput;
import com.yc.core.system.entity.SysUser;
import com.yc.practice.demo.service.ExportService;
import com.yc.practice.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jxls.common.Context;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能描述:导入导出 控制层
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-02-16
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/demo/export")
@Slf4j
@RequiredArgsConstructor
public class ExportController {

    private final ExportService service;
    private final SysUserService sysUserService;

    /**
     * 导出Word
     *
     * @param response 响应
     */
    @PostMapping(value = "/exportWord")
    public void export(HttpServletResponse response) {
        service.export(response);
    }

    /**
     * 导出 excel
     *
     * @param response 响应
     */
    @PostMapping("/exportExcel")
    public void exportExcel(HttpServletResponse response) {
        List<SysUser> list = sysUserService.list(new LambdaQueryWrapper<SysUser>());
        Context context = new Context();
        context.putVar("list", list);
        JxlsOutput.out(response,
                "Demo.xlsx",
                CommonEnum.Reports.DEMO_REPORT.getPath(),
                context);
    }

}
