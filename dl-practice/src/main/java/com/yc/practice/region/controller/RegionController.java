package com.yc.practice.region.controller;

import cn.hutool.core.lang.tree.Tree;
import com.yc.practice.region.service.RegionService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 功能描述:行政区划 控制层
 *
 * @Author: xieyc
 * @Date: 2019-09-20
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/region")
@Api(tags = "行政区划")
@RequiredArgsConstructor
public class RegionController {

    private final RegionService service;

    /**
     * 区域级联信息
     *
     * @return case list
     */
    @GetMapping("/list")
    public List<Tree<String>> list() {
        return service.listAll();
    }

    /**
     * 子级区域级联信息
     *
     * @param regionPcode 父级code
     * @return list children
     */
    @GetMapping("/listChildren")
    public List<Tree<String>> listChildren(@RequestParam("regionPcode") String regionPcode) {
        return service.listChildren(regionPcode);
    }

}
