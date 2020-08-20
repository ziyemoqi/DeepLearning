package com.yc.practice.region.service.impl;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.core.region.entity.Region;
import com.yc.core.region.mapper.RegionMapper;
import com.yc.practice.region.service.RegionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 功能描述: 行政区域 服务层
 *
 * @Author: xieyc && 紫色年华
 * @Date 2019-09-20
 * @Version: 1.0.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RegionServiceImpl extends ServiceImpl<RegionMapper, Region> implements RegionService {

    @Override
    public List<Tree<String>> listAll() {
        List<Region> list = baseMapper.selectList(Wrappers.<Region>lambdaQuery()
                .orderByAsc(Region::getSort)
        );
        return this.handleTree(list);
    }

    @Override
    public List<Tree<String>> listChildren(String regionPcode) {
        List<Region> list = baseMapper.selectList(Wrappers.<Region>lambdaQuery()
                .eq(Region::getRegionPcode, regionPcode)
                .orderByAsc(Region::getSort)
        );
        return this.handleTree(list);
    }

    // ********************** 子方法 *********************

    /**
     * 处理行政区域树
     *
     * @param list 行政区域list
     * @return tree
     */
    private List<Tree<String>> handleTree(List<Region> list) {
        TreeNodeConfig treeNodeConfig = new TreeNodeConfig();
        treeNodeConfig.setNameKey("title");
        return TreeUtil.build(list, "root", treeNodeConfig, (region, treeNode) -> {
            treeNode.setId(region.getRegionCode());
            treeNode.setParentId(region.getRegionPcode());
            treeNode.setName(region.getRegionName());
            treeNode.putExtra("key", region.getRegionCode());
        });
    }
}
