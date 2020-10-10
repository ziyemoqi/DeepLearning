package com.yc.core.mq.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 功能描述:
 *
 * @Author xieyc
 * @Date: 2020-07-27
 * @Version: 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class MqProducerLog implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    @TableId(value = "mq_producer_id", type = IdType.ASSIGN_UUID)
    private String mqProducerId;
    /**
     * 消费者组名
     */
    private String groupName;
    /**
     * 消息主题
     */
    private String msgTopic;
    /**
     * Tag
     */
    private String msgTag;
    /**
     * Key
     */
    private String msgKey;
    /**
     * 消息体
     */
    private String msgBody;
    /**
     * 0:未处理;1:已经处理
     */
    private Boolean state;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;



}
