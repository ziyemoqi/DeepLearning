package com.yc.practice.demo.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.ContentType;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.common.global.error.ErrorException;
import com.yc.common.properties.EncodeProperties;
import com.yc.core.demo.entity.Demo;
import com.yc.core.demo.mapper.DemoMapper;
import com.yc.core.demo.model.DemoQuery;
import com.yc.practice.demo.service.DemoService;
import com.yc.practice.system.service.SysUserService;
import me.chanjar.weixin.open.bean.message.WxOpenXmlMessage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 功能描述: Demo 业务层
 *
 * @Author: xieyc && 紫色年华
 * @Date 2020-04-17
 * @Version: 1.0.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DemoServiceImpl extends ServiceImpl<DemoMapper, Demo> implements DemoService {

    private SysUserService sysUserService;

    private final RedisTemplate redisTemplate;
    private EncodeProperties encodeProperties;

    @Autowired
    public DemoServiceImpl(SysUserService sysUserService, RedisTemplate redisTemplate, EncodeProperties encodeProperties) {
        this.sysUserService = sysUserService;
        this.redisTemplate = redisTemplate;
        this.encodeProperties = encodeProperties;
    }

    @Override
    public Page<Demo> demoPage(Page<Demo> page, DemoQuery query) {
        return this.baseMapper.selectPage(page, Wrappers.<Demo>lambdaQuery()
                .orderByAsc(Demo::getSort)
        );
    }

    @Override
    public void saveDemo(Demo demo) {
        if (StringUtils.isBlank(demo.getDemoId())) {
            baseMapper.insert(demo);
        } else {
            baseMapper.updateById(demo);
        }
    }

    @Override
    public void deleteAlone(String demoId) {
        this.baseMapper.deleteById(demoId);
    }

    private static ReentrantLock lock = new ReentrantLock(true);

    @Override
    public String dd(HttpServletResponse response) {
        lock.lock();
        try {
            return "你好";
        } catch (Exception e) {
            log.error(e.getMessage());
        } finally {
            lock.unlock();
        }
        return null;

    }


}
