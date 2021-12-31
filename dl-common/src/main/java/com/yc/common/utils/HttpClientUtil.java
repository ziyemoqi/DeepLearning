package com.yc.common.utils;

import com.yc.common.constant.CommonConstant;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 功能描述:HTTP请求工具类
 *
 * @Author: xieyc
 * @Date: 2019-05-10 13:48
 */
public class HttpClientUtil {

    private HttpClientUtil() {

    }

    /**
     * Get方式请求
     *
     * @param url   地址
     * @param param Map参数
     * @return 响应
     */
    public static String doGet(String url, Map<String, String> param) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            // 创建uri
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (Map.Entry<String, String> stringStringEntry : param.entrySet()) {
                    builder.addParameter(stringStringEntry.getKey(), stringStringEntry.getValue());
                }
            }
            URI uri = builder.build();
            // 创建http GET请求
            HttpGet httpGet = new HttpGet(uri);
            response = httpclient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == CommonConstant.SUCCESS_CODE) {
                resultString = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpclient.close();
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return resultString;
    }

    /**
     * Post请求
     *
     * @param url   地址
     * @param param Map参数
     * @return 响应
     */
    public static String doPostMap(String url, Map<String, String> param) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            // 处理参数
            if (param != null) {
                List<NameValuePair> paramList = new ArrayList<>();
                for (Map.Entry<String, String> stringStringEntry : param.entrySet()) {
                    paramList.add(new BasicNameValuePair(stringStringEntry.getKey(), stringStringEntry.getValue()));
                }
                // 模拟表单
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramList);
                httpPost.setEntity(entity);
            }
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpClient.close();
                Objects.requireNonNull(response).close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return resultString;
    }

    /**
     * Post请求
     *
     * @param url  地址
     * @param json json字符串
     * @return 响应
     */
    public static String doPostJson(String url, String json) {
        // 创建Httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        String resultString = "";
        try {
            HttpPost httpPost = new HttpPost(url);
            // 创建请求内容
            StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
            httpPost.setEntity(entity);
            // 执行http请求
            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpClient.close();
                Objects.requireNonNull(response).close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return resultString;
    }


}
