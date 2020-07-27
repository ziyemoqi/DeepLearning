package com.yc.practice.mq.service.impl;

import com.yc.practice.mq.service.MqProducerLogService;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * 功能描述:
 *
 * @Author xieyc && 紫色年华
 * @Date 2020-07-27
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/mall/mq-producer-log")
@Slf4j
public class MqProducerLogController {

    @Autowired
    public MqProducerLogService iMqProducerLogService;

}
