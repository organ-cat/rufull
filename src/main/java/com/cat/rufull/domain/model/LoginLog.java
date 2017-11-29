package com.cat.rufull.domain.model;

import java.util.Date;

public class LoginLog {

    private Integer id;         //登陆的id

    private String ip;          //登陆的ip

    private String location;   //登陆的位置

    private Date loginTime;     //登陆的时间

    private Integer accountId;  //登陆的账号的id

    public LoginLog() {
    }

    public LoginLog(Integer id, String ip, String location, Date loginTime, Integer accountId) {
        this.id = id;
        this.ip = ip;
        this.location = location;
        this.loginTime = loginTime;
        this.accountId = accountId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "LoginLog{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", location='" + location + '\'' +
                ", loginTime=" + loginTime +
                ", accountId=" + accountId +
                '}';
    }
}
