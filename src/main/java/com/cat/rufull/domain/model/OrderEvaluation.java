package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class OrderEvaluation implements Serializable {
    private Integer id; // 主键

    private Integer score; // 评分

    private String comment; // 评论

    private String reply; // 商家回复

    private Date evalTime; // 评价时间

    private Order order; // 订单

    private Integer shopId; // 商店id

    private List<ProductEvaluation> productEvaluations; // 订单项列表

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getEvalTime() {
        return evalTime;
    }

    public void setEvalTime(Date evalTime) {
        this.evalTime = evalTime;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public List<ProductEvaluation> getProductEvaluations() {
        return productEvaluations;
    }

    public void setProductEvaluations(List<ProductEvaluation> productEvaluations) {
        this.productEvaluations = productEvaluations;
    }

    @Override
    public String toString() {
        return "OrderEvaluation{" +
                "id=" + id +
                ", score=" + score +
                ", comment='" + comment + '\'' +
                ", reply='" + reply + '\'' +
                ", evalTime=" + evalTime +
                ", order=" + order +
                ", shopId=" + shopId +
                ", productEvaluations=" + productEvaluations +
                '}';
    }
}