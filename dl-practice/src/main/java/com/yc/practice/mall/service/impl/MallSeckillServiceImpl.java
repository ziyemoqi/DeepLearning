package com.yc.practice.mall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.common.constant.CommonConstant;
import com.yc.common.global.error.Error;
import com.yc.common.global.error.ErrorException;
import com.yc.core.mall.entity.MallSeckill;
import com.yc.core.mall.entity.MallSeckillSuccess;
import com.yc.core.mall.mapper.MallSeckillMapper;
import com.yc.core.mall.mapper.MallSeckillSuccessMapper;
import com.yc.core.mall.model.form.SeckillForm;
import com.yc.core.mall.model.vo.SeckillVO;
import com.yc.practice.common.UserUtil;
import com.yc.practice.mall.service.MallSeckillService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能描述:
 *
 * @Author: xieyc && 紫色年华
 * @Date 2020-06-01
 * @Version: 1.0.0
 */
@Slf4j
@Service
public class MallSeckillServiceImpl extends ServiceImpl<MallSeckillMapper, MallSeckill> implements MallSeckillService {

    private MallSeckillSuccessMapper mallSeckillSuccessMapper;
    private final RedisTemplate redisTemplate;

    @Autowired
    public MallSeckillServiceImpl(MallSeckillSuccessMapper mallSeckillSuccessMapper, RedisTemplate redisTemplate) {
        this.mallSeckillSuccessMapper = mallSeckillSuccessMapper;
        this.redisTemplate = redisTemplate;
    }

    @Override
    public Page<MallSeckill> pageMallSeckill(Page<MallSeckill> page) {
        return baseMapper.selectPage(page, Wrappers.<MallSeckill>lambdaQuery()
                .eq(MallSeckill::getDelFlag, false)
                .orderByDesc(MallSeckill::getSeckillEndTime)
        );
    }

    @Override
    public void saveMallSeckill(MallSeckill mallSeckill) {
        if (StringUtils.isNotBlank(mallSeckill.getMallSeckillId())) {
            mallSeckill.setUpdateUserId(UserUtil.getUserId());
            this.baseMapper.updateById(mallSeckill);
            String key = CommonConstant.MALL_SECKILL + mallSeckill.getMallSeckillId();
            redisTemplate.opsForHash().put(key, "seckillStartTime", mallSeckill.getSeckillStartTime());
            redisTemplate.opsForHash().put(key, "seckillEndTime", mallSeckill.getSeckillEndTime());
            redisTemplate.opsForHash().put(key, "mallProductName", mallSeckill.getMallProductName());
        } else {
            mallSeckill.setCreateUserId(UserUtil.getUserId());
            this.baseMapper.insert(mallSeckill);
        }
    }

    @Override
    public void deleteAlone(String mallSeckillId) {
        MallSeckill mallSeckill = new MallSeckill();
        mallSeckill.setMallSeckillId(mallSeckillId);
        mallSeckill.setDelFlag(1);
        this.baseMapper.updateById(mallSeckill);
    }

    @Override
    public SeckillVO mallSeckill(String mallSeckillId) {
        SeckillVO seckillVO = new SeckillVO();
        String key = CommonConstant.MALL_SECKILL + mallSeckillId;
        if (redisTemplate.hasKey(key)) {
            seckillVO.setSeckillStartTime(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillStartTime").toString()));
            seckillVO.setSeckillEndTime(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillEndTime").toString()));
            seckillVO.setMallProductName(redisTemplate.opsForHash().get(key, "mallProductName").toString());
            // 状态(0:未开始 1:开始秒杀 2:已结束)
            if (LocalDateTime.now().isBefore(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillStartTime").toString()))) {
                seckillVO.setState("0");
            } else if (LocalDateTime.now().isEqual(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillStartTime").toString())) ||
                    LocalDateTime.now().isEqual(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillEndTime").toString()))) {
                seckillVO.setState("1");
            } else if (LocalDateTime.now().isAfter(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillStartTime").toString())) &&
                    LocalDateTime.now().isBefore(LocalDateTime.parse(redisTemplate.opsForHash().get(key, "seckillEndTime").toString()))) {
                seckillVO.setState("1");
            } else {
                seckillVO.setState("2");
            }
        } else {
            MallSeckill seckill = this.baseMapper.selectById(mallSeckillId);
            redisTemplate.opsForHash().put(key, "seckillStartTime", seckill.getSeckillStartTime());
            redisTemplate.opsForHash().put(key, "seckillEndTime", seckill.getSeckillEndTime());
            redisTemplate.opsForHash().put(key, "mallProductName", seckill.getMallProductName());
            BeanUtil.copyProperties(seckill, seckillVO);
            // 状态(0:未开始 1:开始秒杀 2:已结束)
            if (LocalDateTime.now().isBefore(seckill.getSeckillStartTime())) {
                seckillVO.setState("0");
            } else if (LocalDateTime.now().isEqual(seckill.getSeckillStartTime()) || LocalDateTime.now().isEqual(seckill.getSeckillEndTime())) {
                seckillVO.setState("1");
            } else if (LocalDateTime.now().isAfter(seckill.getSeckillStartTime()) && LocalDateTime.now().isBefore(seckill.getSeckillEndTime())) {
                seckillVO.setState("1");
            } else {
                seckillVO.setState("2");
            }
        }
        seckillVO.setLocalDateTime(LocalDateTime.now());
        seckillVO.setMd5(DigestUtil.md5Hex(mallSeckillId + CommonConstant.SLAT));
        return seckillVO;
    }

    /**
     * 使用注解控制事务:
     * 1.保证事务方法的执行时间尽可能短,不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
     * 2.不是所有的方法都需要事务,如一些查询的service || 只有一条修改操作的service
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void execSeckill(SeckillForm seckillForm) {
        // 验签
        String md5 = DigestUtil.md5Hex(seckillForm.getMallSeckillId() + CommonConstant.SLAT);
        if (!StringUtils.equals(md5, seckillForm.getMd5())) {
            throw new ErrorException(Error.IllegalRequest);
        }
        // 执行秒杀逻辑: 1.减库存.2.记录购买行为
        MallSeckillSuccess mallSeckillSuccess = new MallSeckillSuccess();
        mallSeckillSuccess.setMallSeckillId(seckillForm.getMallSeckillId());
        mallSeckillSuccess.setSysUserId(UserUtil.getUserId());
        try {
            mallSeckillSuccessMapper.insert(mallSeckillSuccess);
        } catch (Exception e) {
            throw new ErrorException(Error.DuplicateSeckill);
        }
        seckillForm.setKillTime(LocalDateTime.now().toString());
        int result = this.baseMapper.reduceNumber(seckillForm);
        if (result <= 0) {
            throw new ErrorException(Error.SeckillOver);
        }
    }


    /**
     * 基于存储过程执行秒杀
     * 注:存储过程优化的是事务行级锁持有的时间
     *
     * @param seckillForm 入参
     */
    @Override
    public void execSeckillByProcedure(SeckillForm seckillForm) {
        // 验签
        String md5 = DigestUtil.md5Hex(seckillForm.getMallSeckillId() + CommonConstant.SLAT);
        if (!StringUtils.equals(md5, seckillForm.getMd5())) {
            throw new ErrorException(Error.IllegalRequest);
        }
        // 记录购买信息,减库存
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mallSeckillId", seckillForm.getMallSeckillId());
        map.put("killTime", LocalDateTime.now().toString());
        // map.put("sysUserId", UserUtil.getUserId());
        map.put("sysUserId", LocalDateTime.now().toString());
        map.put("result", null);
        // 执行存储过程 赋值result
        this.baseMapper.killByProcedure(map);
        int result = MapUtils.getInteger(map, "result", -2);
        if (result == 0) {
            log.error("秒杀结束");
            throw new ErrorException(Error.SeckillOver);
        } else if (result == -1) {
            log.error("重复秒杀");
            throw new ErrorException(Error.DuplicateSeckill);
        } else if (result == -2) {
            log.error("服务异常");
            throw new ErrorException(Error.ServiceError);
        }
        log.info("秒杀成功！");
    }

}
