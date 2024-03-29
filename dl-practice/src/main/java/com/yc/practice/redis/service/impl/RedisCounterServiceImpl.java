package com.yc.practice.redis.service.impl;

import com.yc.common.constant.CommonConstant;
import com.yc.practice.redis.service.RedisCounterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.support.atomic.RedisAtomicLong;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-02-01
 * @Version: 1.0.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class RedisCounterServiceImpl implements RedisCounterService {

    private final RedisTemplate redisTemplate;

    @Autowired
    public RedisCounterServiceImpl(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Override
    public String importDevice() {
        String key = CommonConstant.DEVICE_REPAIR;
        if (Boolean.TRUE.equals(redisTemplate.hasKey(key))) {
            if ((int) (redisTemplate.opsForValue().get(key)) > 5) {
                return "操作过于频繁，请稍后再试！";
            }
        }
        StringBuilder order = new StringBuilder();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = sdf.format(new Date());
        Long incr = this.incr(key, 1);
        // 防止初始化时为1
        if (incr.intValue() == 0) {
            incr = this.incr(key, 1);
        }
        DecimalFormat df = new DecimalFormat("00000");
        String[] drs = dateString.split("-");
        for (int i = 1; i < drs.length; i++) {
            order.append(drs[i]);
        }
        return "X" + order + df.format(incr);
    }

    /**
     * 递增指定key
     *
     * @param key      key
     * @param liveTime 有效期(分钟)
     * @return
     */
    private Long incr(String key, long liveTime) {
        RedisAtomicLong entityIdCounter = new RedisAtomicLong(key, Objects.requireNonNull(redisTemplate.getConnectionFactory()));
        long increment = entityIdCounter.getAndIncrement();
        // 初始设置过期时间
        if ((increment == 0) && liveTime > 0) {
            entityIdCounter.expire(liveTime, TimeUnit.MINUTES);
        }
        return increment;
    }

}
