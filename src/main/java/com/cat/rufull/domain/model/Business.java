package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.List;

public class Business implements Serializable {
    private Integer id;                     // 主键

    private String frontPhoto;              // 室外图片

    private String insidePhoto;             // 室内图片

    private String idBackPhoto;             // 身份证背面照片

    private String idFrontPhoto;            // 身份证正面照片

    private String identifier;              // 身份证号

    private String businessLicence;         // 商家营业执照

    private String cateringServiceLicense;  // 餐厅服务营业执照

    private Account account;                // 用户和商家1对1关系

    private List<Order> orderList;          // 商家和订单1对多关系

    // 商店信息保留
    private Shop shop;                      // 商家和商店1对1关系

    public Business() {
    }

    public Business(Integer id, String frontPhoto, String insidePhoto, String idBackPhoto, String idFrontPhoto, String identifier, String businessLicence, String cateringServiceLicense, Account account, List<Order> orderList, Shop shop) {
        this.id = id;
        this.frontPhoto = frontPhoto;
        this.insidePhoto = insidePhoto;
        this.idBackPhoto = idBackPhoto;
        this.idFrontPhoto = idFrontPhoto;
        this.identifier = identifier;
        this.businessLicence = businessLicence;
        this.cateringServiceLicense = cateringServiceLicense;
        this.account = account;
        this.orderList = orderList;
        this.shop = shop;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFrontPhoto() {
        return frontPhoto;
    }

    public void setFrontPhoto(String frontPhoto) {
        this.frontPhoto = frontPhoto == null ? null : frontPhoto.trim();
    }

    public String getInsidePhoto() {
        return insidePhoto;
    }

    public void setInsidePhoto(String insidePhoto) {
        this.insidePhoto = insidePhoto == null ? null : insidePhoto.trim();
    }

    public String getIdBackPhoto() {
        return idBackPhoto;
    }

    public void setIdBackPhoto(String idBackPhoto) {
        this.idBackPhoto = idBackPhoto == null ? null : idBackPhoto.trim();
    }

    public String getIdFrontPhoto() {
        return idFrontPhoto;
    }

    public void setIdFrontPhoto(String idFrontPhoto) {
        this.idFrontPhoto = idFrontPhoto == null ? null : idFrontPhoto.trim();
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier == null ? null : identifier.trim();
    }

    public String getBusinessLicence() {
        return businessLicence;
    }

    public void setBusinessLicence(String businessLicence) {
        this.businessLicence = businessLicence == null ? null : businessLicence.trim();
    }

    public String getCateringServiceLicense() {
        return cateringServiceLicense;
    }

    public void setCateringServiceLicense(String cateringServiceLicense) {
        this.cateringServiceLicense = cateringServiceLicense == null ? null : cateringServiceLicense.trim();
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    @Override
    public String toString() {
        return "Business{" +
                "id=" + id +
                ", frontPhoto='" + frontPhoto + '\'' +
                ", insidePhoto='" + insidePhoto + '\'' +
                ", idBackPhoto='" + idBackPhoto + '\'' +
                ", idFrontPhoto='" + idFrontPhoto + '\'' +
                ", identifier='" + identifier + '\'' +
                ", businessLicence='" + businessLicence + '\'' +
                ", cateringServiceLicense='" + cateringServiceLicense + '\'' +
                ", account=" + account +
                ", orderList=" + orderList +
                ", shop=" + shop +
                '}';
    }
}