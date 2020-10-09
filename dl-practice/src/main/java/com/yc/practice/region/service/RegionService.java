package com.yc.practice.region.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yc.core.region.entity.Region;

import java.util.List;

/**
 * 功能描述: 行政区域 接口
 *
 * @Author: xieyc
 * @Date 2019-09-20
 * @Version: 1.0.0
 */
public interface RegionService extends IService<Region> {

    /**
     * 区域级联信息
     *
     * @return case list
     */
    List<Tree<String>> listAll();

    /**
     * 子级区域级联信息
     *
     * @param regionPcode 父级code
     * @return list children
     */
    List<Tree<String>> listChildren(String regionPcode);
}
