package com.yc.practice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 功能描述:
 * 主程序类、主入口类
 *
 * @Author: xieyc
 * @Date: 2019-05-30
 */
@SpringBootApplication
@EnableScheduling
@ComponentScan({"com.yc"})
public class DlPracticeApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(DlPracticeApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DlPracticeApplication.class);
    }

}
