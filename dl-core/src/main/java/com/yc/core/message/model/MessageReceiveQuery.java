package com.yc.core.message.model;

import lombok.Data;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-05-21
 * @Version: 1.0.0
 */
@Data
public class MessageReceiveQuery {

    /**
     * 标题
     */
    private String title;

    /**
     * 用户ID
     */
    private String userId;
}
