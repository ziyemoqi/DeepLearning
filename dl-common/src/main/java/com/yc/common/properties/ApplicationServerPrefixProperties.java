package com.yc.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 功能描述: 应用服务地址
 *
 * @Author: xieyc
 * @Date: 2020-05-23
 * @Version: 1.0.0
 */
@Data
@Component
@ConfigurationProperties(prefix = "application.server-prefix")
public class ApplicationServerPrefixProperties {

    private MiniAppApi miniapp;

    @Data
    public static class MiniAppApi {

        private String test1;

        private String test2;

        private String test3;

        private String test4;
    }

}
