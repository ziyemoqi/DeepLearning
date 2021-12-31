package com.yc.practice.config.swagger;

import com.github.xiaoymin.swaggerbootstrapui.annotations.EnableSwaggerBootstrapUI;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-12-13
 */
@Configuration
@EnableSwagger2
@EnableSwaggerBootstrapUI
public class Swagger2Config {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.yc.practice.system.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * swagger-bootstrap-ui默认访问地址是：http://${host}:${port}/doc.html
     *
     * @return
     */

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("swagger-bootstrap-ui RESTful APIs")
                .description("swagger-bootstrap-ui")
                .termsOfServiceUrl("http://localhost:8082/")
                .description("测试Swagger2")
                .version("1.0")
                .build();
    }


}
