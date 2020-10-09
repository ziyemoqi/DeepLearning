package com.yc.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 微信支付属性文件
 *
 * @author xieyc
 * @date 2020-08-20
 */
@Data
@Component
@ConfigurationProperties(prefix = "wx.pay")
public class WxPayProperties {
    /**
     * appid
     */
    private String appId;
    /**
     * 微信支付商户号
     */
    private String mchId;
    /**
     * 微信支付商户密钥
     */
    private String mchKey;
    /**
     * apiclient_cert.p12文件的绝对路径，或者如果放在项目中，请以classpath:开头指定
     */
    private String keyPath;
}
