package com.yc.practice.listner;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.Topic;
import org.springframework.stereotype.Component;

/**
 * 功能描述: redis 失效key监听器实现
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-08-20
 */
@Slf4j
@Component
public class ListenerModule extends KeyExpirationEventMessageListener {

    private static final Topic KEYEVENT_EXPIRED_TOPIC = new PatternTopic("__keyevent@0__:expired");

    @Autowired
    public ListenerModule(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    @Override
    protected void doRegister(RedisMessageListenerContainer listenerContainer) {
        listenerContainer.addMessageListener(this, KEYEVENT_EXPIRED_TOPIC);
    }

    /**
     * 监听失效cacheKey
     */
    @Override
    public void onMessage(Message message, byte[] pattern) {
        String expiredKey = message.toString();
        System.out.println("失效key:" + expiredKey);
    }


}
