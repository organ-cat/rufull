package com.cat.rufull.domain.model;

import java.io.Serializable;

/*
    收藏类
 */
public class Favor implements Serializable {
    private Integer id;                 // 用户收藏商家id

    private Integer accountId;          // 用户id

    private Integer shopId;             // 商家id

    public Favor() {
    }

    public Favor(Integer id, Integer accountId, Integer shopId) {
        this.id = id;
        this.accountId = accountId;
        this.shopId = shopId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
        return "Favor{" +
                "id=" + id +
                ", accountId=" + accountId +
                ", shopId=" + shopId +
                '}';
    }
}