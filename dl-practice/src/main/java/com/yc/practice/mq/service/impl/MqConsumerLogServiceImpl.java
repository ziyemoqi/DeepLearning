package com.yc.practice.mq.service.impl;

import com.yc.core.mq.entity.MqConsumerLog;
import com.yc.core.mq.mapper.MqConsumerLogMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.practice.mq.service.MqConsumerLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* 功能描述:
*
* @Author xieyc
* @Date: 2020-07-27
* @Version: 1.0.0
*/
@Service
@Transactional(rollbackFor = Exception.class)
public class MqConsumerLogServiceImpl extends ServiceImpl<MqConsumerLogMapper, MqConsumerLog> implements MqConsumerLogService {

}
