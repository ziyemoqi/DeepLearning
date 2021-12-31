package com.yc.practice.common.log;

import com.alibaba.fastjson.JSON;
import com.yc.common.utils.LocalHostUtil;
import com.yc.core.system.entity.SysLog;
import com.yc.core.system.entity.SysUser;
import com.yc.core.system.mapper.SysLogMapper;
import com.yc.core.system.model.SysLogDto;
import com.yc.practice.common.UserUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

/**
 * 功能描述: 架构日志服务类
 *
 * @Company 紫色年华
 * @Author xieyc
 * @Datetime 2019-05-31 10:58
 */
@Service
@Slf4j
public class SystemLogService {

    private final SysLogMapper sysLogMapper;

    @Autowired
    public SystemLogService(SysLogMapper sysLogMapper) {
        this.sysLogMapper = sysLogMapper;
    }

    boolean write(HttpServletRequest request, String opPosition, int opType, int logType, String requestMethod,
                  long costTimeMillis, int opResult) {
        String message = new String[]{"创建", "删除", "更新", "读取"}[opType] + "位置【" + opPosition + "】" + (opResult != 1
                ? "成功" : "失败");
        return write(UserUtil.getUser(),
                SysLogDto.builder()
                        .opType(opType)
                        .logType(logType)
                        .requestMethod(requestMethod)
                        .requestUrl(request.getRequestURI())
                        .requestType(request.getMethod())
                        .requestParam(JSON.toJSONString(request.getParameterMap()))
                        .costTime(costTimeMillis)
                        .build(), message);
    }

    private boolean write(SysUser sysUser, SysLogDto sysLogDto, String... describe) {
        sysUser = sysUser != null ? sysUser : new SysUser();
        StringBuilder tmpDesc = new StringBuilder();
        for (int i = 0; i < describe.length; i++) {
            tmpDesc.append(describe[i]).append(i < describe.length - 1 ? "\r\n" : "");
        }
        int result = sysLogMapper.insert(SysLog.builder()
                .requestMethod(sysLogDto.getRequestMethod())
                .requestUrl(sysLogDto.getRequestUrl())
                .requestType(sysLogDto.getRequestType())
                .requestParam(sysLogDto.getRequestParam())
                .createTime(LocalDateTime.now())
                .createUserId(sysUser.getSysUserId())
                .ipAddress(LocalHostUtil.getIpAddress())
                .opType(sysLogDto.getOpType())
                .costTime(sysLogDto.getCostTime())
                .logType(sysLogDto.getLogType())
                .logContent(tmpDesc.toString())
                .build());
        return result > 0;
    }

}
