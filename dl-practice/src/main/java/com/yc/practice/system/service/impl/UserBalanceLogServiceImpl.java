package com.yc.practice.system.service.impl;

import com.yc.core.system.entity.UserBalanceLog;
import com.yc.core.system.mapper.UserBalanceLogMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.practice.system.service.UserBalanceLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* 功能描述:
*
* @Author xieyc
* @Date 2020-07-27
* @Version: 1.0.0
*/
@Service
@Transactional(rollbackFor = Exception.class)
public class UserBalanceLogServiceImpl extends ServiceImpl<UserBalanceLogMapper, UserBalanceLog> implements UserBalanceLogService {

}
