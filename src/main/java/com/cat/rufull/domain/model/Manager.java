package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.Date;

public class Manager implements Serializable {

    private Integer id;            //管理员的id

    private String username;      //管理员的用户名

    private String password;      //管理员的密码

    private String phone;         //管理员的手机

    private String email;         //管理员的邮箱

    private String photo;         //管理员的头像

    private Integer status;       // 管理员的状态

    private Date createdTime;     //管理员的被创建的时间

    private Integer role;          //管理员的状态

    public Manager() {
    }

    public Manager(Integer id, String username, String password, String phone, String email, String photo, Integer status, Date createdTime, Integer role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.photo = photo;
        this.status = status;
        this.createdTime = createdTime;
        this.role = role;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", photo='" + photo + '\'' +
                ", status=" + status +
                ", createdTime=" + createdTime +
                ", role=" + role +
                '}';
    }
}
