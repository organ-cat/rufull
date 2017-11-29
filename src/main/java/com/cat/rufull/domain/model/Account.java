package com.cat.rufull.domain.model;

import java.sql.Date;

public class Account {

    private Integer id;           //账号的id

    private String username;     //账号的用户名

    private String password;     //账号的密码

    private String phone;        //账号的手机

    private String email;        //账号的邮箱

    private String nickname;     //账号的呢称

    private String photo;         //账号的头像

    private double balance;      //账号的余额

    private int status;          //账号的状态

    private Date registerTime;   //账号的注册时间

    public Account() {
    }

    public Account(Integer id, String username, String password, String phone, String email, String nickname, String photo, double balance, int status, Date registerTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.nickname = nickname;
        this.photo = photo;
        this.balance = balance;
        this.status = status;
        this.registerTime = registerTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", photo='" + photo + '\'' +
                ", balance=" + balance +
                ", status=" + status +
                ", registerTime=" + registerTime +
                '}';
    }
}
