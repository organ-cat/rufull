package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.Date;

public class Footprint implements Serializable {

    private Integer id;         // 足迹的id

    private Date accessTime;    // 进入商家的时间

    private Integer accountId;  // 账号的id

    private Integer shopId;     // 浏览的商家

    public static final String FOOTPRINT_LIST = "footprintList";

    public Footprint() {
    }
    public Footprint(Integer shopId,Integer accountId) {
        this.accountId = accountId;
        this.shopId = shopId;
    }

    public Footprint(Date accessTime, Integer accountId, Integer shopId) {
        this.accessTime = accessTime;
        this.accountId = accountId;
        this.shopId = shopId;
    }

    public Footprint(Integer id, Date accessTime, Integer accountId, Integer shopId) {
        this.id = id;
        this.accessTime = accessTime;
        this.accountId = accountId;
        this.shopId = shopId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(Date accessTime) {
        this.accessTime = accessTime;
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
        return "Footprint{" +
                "id=" + id +
                ", accessTime=" + accessTime +
                ", accountId=" + accountId +
                ", shopId=" + shopId +
                '}';
    }
}
