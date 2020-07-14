package com.yc.mini.mall.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.core.mall.entity.MallProduct;
import com.yc.core.mall.mapper.MallProductMapper;
import com.yc.core.mall.model.query.GoodQuery;
import com.yc.mini.mall.service.MallProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 功能描述:
 *
 * @Author: xieyc && 紫色年华
 * @Date 2020-04-08
 * @Version: 1.0.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MallProductServiceImpl extends ServiceImpl<MallProductMapper, MallProduct> implements MallProductService {


    @Override
    public Page<MallProduct> pageMallProduct(Page<MallProduct> page, GoodQuery query) {
        return this.baseMapper.goodPage(page, query);
    }

    @Override
    public MallProduct getMallProduct(String mallProductId) {
        return baseMapper.selectById(mallProductId);
    }

}
