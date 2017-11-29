package com.cat.rufull.domain.model;

import java.io.Serializable;

/**
 * 消息类
 */
public class Message implements Serializable {
    private Integer id;         // 主键

    private String type;        // 消息类型

    private String content;     // 消息内容

    private String status;      // 消息状态

    private Integer senderId;   // 发送方的用户id

    private Integer receiverId; // 接收方的用户id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }
}
