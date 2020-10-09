package com.yc.practice.system.controller;

import com.yc.practice.system.service.UserBalanceLogService;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * 功能描述:
 *
 * @Author xieyc
 * @Date 2020-07-27
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/mall/user-balance-log")
@Slf4j
public class UserBalanceLogController {

    @Autowired
    public UserBalanceLogService iUserBalanceLogService;

}
