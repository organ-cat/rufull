package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.Date;

public class ProductEvaluation implements Serializable {
    private Integer id; // 主键

    private String score; // 评分

    private String comment; // 评论

    private Integer orderEvalId; // 订单评价id

    private LineItem item; // 订单项

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getOrderEvalId() {
        return orderEvalId;
    }

    public void setOrderEvalId(Integer orderEvalId) {
        this.orderEvalId = orderEvalId;
    }

    public LineItem getItem() {
        return item;
    }

    public void setItem(LineItem item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "ProductEvaluation{" +
                "id=" + id +
                ", score='" + score + '\'' +
                ", comment='" + comment + '\'' +
                ", orderEvalId=" + orderEvalId +
                ", item=" + item +
                '}';
    }
}