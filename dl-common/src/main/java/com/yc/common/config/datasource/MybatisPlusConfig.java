package com.yc.common.config.datasource;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 功能描述: MyBatis配置
 *
 * @Author: xieyc
 * @Date: 2020-10-03
 */
@Configuration
@MapperScan("com.yc.core.*.mapper")
public class MybatisPlusConfig {


    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
