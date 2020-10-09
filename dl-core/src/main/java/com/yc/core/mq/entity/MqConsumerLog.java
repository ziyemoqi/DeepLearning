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
public class MqConsumerLog implements Serializable {

    private static final long serialVersionUID = 1L;
    private String mqConsumerId;
    /**
     * 分组名称
     */
    @TableId(value = "group_name", type = IdType.ASSIGN_UUID)
    private String groupName;
    /**
     * Tag
     */
    private String msgTag;
    /**
     * key
     */
    private String msgKey;
    /**
     * 消息体
     */
    private String msgBody;
    /**
     * 0:正在处理;1:处理成功;2:处理失败
     */
    private Boolean state;
    /**
     * 消费次数
     */
    private Integer consumerTimes;
    /**
     * 消费时间
     */
    private LocalDateTime consumerTimestamp;
    /**
     * 备注
     */
    private String remark;



}
