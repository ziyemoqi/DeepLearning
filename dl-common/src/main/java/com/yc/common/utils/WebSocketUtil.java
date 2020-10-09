package com.yc.common.utils;

import com.alibaba.fastjson.JSONObject;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * 功能描述: websocket 操作类
 *
 * @Author: xieyc
 * @Date: 2019-10-08
 * @Version: 1.0.0
 */
@Slf4j
@Component
@EqualsAndHashCode(callSuper = false)
@ServerEndpoint("/websocket/{userId}")
public class WebSocketUtil {

    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;

    /**
     * 用户ID
     */
    private String userId = "";

    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象
     */
    private static CopyOnWriteArraySet<WebSocketUtil> webSockets = new CopyOnWriteArraySet<>();
    private static Map<String, Session> sessionPool = new HashMap<String, Session>();

    /**
     * 连接建立成功
     * 【适当添加业务逻辑：监听用户登录后推送未成功接受的历史消息】
     *
     * @param session 会话
     * @param userId  用户id
     */
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "userId") String userId) {
        try {
            this.session = session;
            webSockets.add(this);
            sessionPool.put(userId, session);
            this.userId = userId;
            log.info("【websocket消息】有新的连接，总数为:" + webSockets.size());
        } catch (Exception e) {
            log.error("websocket 链接异常");
        }
    }

    /**
     * 连接关闭
     */
    @OnClose
    public void onClose() {
        try {
            webSockets.remove(this);
            log.info("【websocket消息】连接断开，总数为:" + webSockets.size());
        } catch (Exception e) {
            log.error("websocket 链接断开异常");
        }
    }

    /**
     * 收到客户端消息
     *
     * @param message 消息
     */
    @OnMessage
    public void onMessage(String message) {
        log.info("【websocket消息】收到客户端" + userId + "的消息:" + message);
        JSONObject obj = new JSONObject();
        //业务类型
        obj.put("type", "heartcheck");
        //消息内容
        obj.put("content", "心跳响应");
        session.getAsyncRemote().sendText(obj.toJSONString());
    }

    /**
     * 广播消息
     *
     * @param message 消息
     */
    public void sendAllMessage(String message) {
        log.info("【websocket消息】广播消息:" + message);
        for (WebSocketUtil webSocket : webSockets) {
            try {
                if (webSocket.session.isOpen()) {
                    webSocket.session.getAsyncRemote().sendText(message);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 单点消息
     *
     * @param userId  用户id
     * @param message 消息
     * @return 是否推送成功 true: 成功
     */
    public boolean sendOneMessage(String userId, String message) {
        Session session = sessionPool.get(userId);
        if (session != null && session.isOpen()) {
            try {
                log.info("【websocket消息】 单点消息:" + message);
                session.getAsyncRemote().sendText(message);
                return true;
            } catch (Exception e) {
                log.info("【websocket消息】 单点消息异常:" + e.getMessage());
            }
        }
        return false;
    }

    /**
     * 单点消息(多人)
     *
     * @param userIds 用户ID
     * @param message 消息内容
     */
    public void sendMoreMessage(String[] userIds, String message) {
        for (String userId : userIds) {
            Session session = sessionPool.get(userId);
            if (session != null && session.isOpen()) {
                try {
                    log.info("【websocket消息】 单点消息:" + message);
                    session.getAsyncRemote().sendText(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
