package com.cat.rufull.domain.model;


import java.io.Serializable;
import java.util.Date;

public class Complaint implements Serializable {

    private Integer id;         // 投诉的id

    private Integer type;       // 投诉的类型

    private String content;     // 投诉的内容

    private String evidence;   // 投诉的证据，图

    private Date createdTime;   // 投诉时间对应被创建时间

    private Integer status;     // 投诉状态

    private Date completedTime; // 投诉处理结束时间

    private Integer result;     // 投诉处理后的结果

    private Integer solver;     // 投诉处理者

    private Account account;  // 投诉的用户

    private Shop shop;     // 被投诉的商店

    public static final Integer NO_MEALS_ON_WHEELS = 1;
    public static final Integer FOOD_HEALTH_SECURITY_PROBLEM = 2;
    public static final Integer OTHER_PROBLEM = 3;

    public static final Integer COMPLAINTED = 1;
    public static final Integer HANDLING = 2;
    public static final Integer COMPLETED_COMPLAINTION = 3;

    public static final Integer RESULT_TRUE = 1;
    public static final Integer RESULT_FAKE = 2;


    public Complaint(Integer type, String content, String evidence, Date createdTime, Integer status, Account account, Shop shop) {
        this.type = type;
        this.content = content;
        this.evidence = evidence;
        this.createdTime = createdTime;
        this.status = status;
        this.account = account;
        this.shop = shop;
    }

    public Complaint() {
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

    public String getEvidence() {
        return evidence;
    }

    public void setEvidence(String evidence) {
        this.evidence = evidence;
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public static Integer getNoMealsOnWheels() {
        return NO_MEALS_ON_WHEELS;
    }

    public static Integer getFoodHealthSecurityProblem() {
        return FOOD_HEALTH_SECURITY_PROBLEM;
    }

    public static Integer getOtherProblem() {
        return OTHER_PROBLEM;
    }

    public static Integer getCOMPLAINTED() {
        return COMPLAINTED;
    }

    public static Integer getHANDLING() {
        return HANDLING;
    }

    public static Integer getCompletedComplaintion() {
        return COMPLETED_COMPLAINTION;
    }

    public static Integer getResultTrue() {
        return RESULT_TRUE;
    }

    public static Integer getResultFake() {
        return RESULT_FAKE;
    }
}
