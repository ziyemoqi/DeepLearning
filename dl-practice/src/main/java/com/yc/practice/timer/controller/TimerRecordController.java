package com.yc.practice.timer.controller;

import com.yc.practice.timer.service.TimerRecordService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 功能描述:定时器记录 控制层
 *
 * @Author: xieyc
 * @Date 2020-04-16
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/timerRecord")
@Slf4j
public class TimerRecordController {

    private final TimerRecordService service;

    @Autowired
    public TimerRecordController(TimerRecordService service) {
        this.service = service;
    }

    /**
     * 超时订单取消
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void orderCheck() {
        service.orderCheck();
    }

    /**
     * 刷新ComponentAccessToken(1小时50分钟)
     */
    @Scheduled(cron = "0 50 0/2 * * ?")
    public void refreshComponentAccessToken() {
        log.info("=========== 刷新ComponentAccessToken START ===========");
        System.out.println(new Date());
        log.info("=========== 刷新ComponentAccessToken END ===========");


    }
}
