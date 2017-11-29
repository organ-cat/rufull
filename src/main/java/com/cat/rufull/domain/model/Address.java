package com.cat.rufull.domain.model;

public class Address {

    private Integer id;         // 地址的id

    private String receiver;    // 地址的收货人

    private String phone;       // 地址收货人的手机

    private String location;    // 地址的位置

    private String detail;      // 地址的详细位置

    private Integer status;     // 地址的状态

    private Integer accountId;  // 地址对应的账号

    public Address() {
    }

    public Address(Integer id, String receiver, String phone, String location, String detail, Integer status, Integer accountId) {
        this.id = id;
        this.receiver = receiver;
        this.phone = phone;
        this.location = location;
        this.detail = detail;
        this.status = status;
        this.accountId = accountId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                ", location='" + location + '\'' +
                ", detail='" + detail + '\'' +
                ", status=" + status +
                ", accountId=" + accountId +
                '}';
    }
}
