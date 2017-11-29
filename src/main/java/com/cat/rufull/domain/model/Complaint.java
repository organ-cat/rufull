package com.cat.rufull.domain.model;


import java.util.Date;

public class Complaint {

    private Integer id;         // 投诉的id

    private Integer type;       // 投诉的类型

    private String content;     // 投诉的内容

    private String evindence;   // 投诉的证据，图

    private Date createdTime;   // 投诉时间对应被创建时间

    private Integer status;     // 投诉状态

    private Date completedTime; // 投诉处理结束时间

    private Integer result;     // 投诉处理后的结果

    private Integer solver;     // 投诉处理者

    private Integer accountId;  // 投诉的用户

    private Integer shopId;     // 被投诉的商店

    public Complaint() {
    }

    public Complaint(Integer id, Integer type, String content, String evindence, Date createdTime, Integer status, Date completedTime, Integer result, Integer solver, Integer accountId, Integer shopId) {
        this.id = id;
        this.type = type;
        this.content = content;
        this.evindence = evindence;
        this.createdTime = createdTime;
        this.status = status;
        this.completedTime = completedTime;
        this.result = result;
        this.solver = solver;
        this.accountId = accountId;
        this.shopId = shopId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getEvindence() {
        return evindence;
    }

    public void setEvindence(String evindence) {
        this.evindence = evindence;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCompletedTime() {
        return completedTime;
    }

    public void setCompletedTime(Date completedTime) {
        this.completedTime = completedTime;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getSolver() {
        return solver;
    }

    public void setSolver(Integer solver) {
        this.solver = solver;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    @Override
    public String toString() {
        return "Complaint{" +
                "id=" + id +
                ", type=" + type +
                ", content='" + content + '\'' +
                ", evindence='" + evindence + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", completedTime=" + completedTime +
                ", result=" + result +
                ", solver=" + solver +
                ", accountId=" + accountId +
                ", shopId=" + shopId +
                '}';
    }
}