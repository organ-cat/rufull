package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/*
    商家类
 */
public class Shop implements Serializable {
    private Integer id;                         // 商店id主键

    private String shopName;                    // 商店名称

    private Integer shopType;                   // 商店类型

    private String shopPhoto;                   // 商店照片

    private String shopPhone;                   // 商店电话

    private String address;                     // 商店详细地址

    private String operateTime;                // 营业时间

    private Integer operateState;              // 营业状态：还没有确定有多少个状态

    private String lat;                         // 商店在地图上经度

    private String lon;                         // 商店在地图上维度

    private Integer supportPayment;            // 支持支付方式

    private Integer shippingDistance;          // 配送距离

    private BigDecimal shippingPrice;          // 配送起价

    private Integer shippingTime;              // 配送时间

    private BigDecimal shippingFee;            // 配送费用

    private String announcement;               // 商店公告

    private Business business;                  // 商店与商家1对1关系

    private List<Product> productList;          // 商店与商品1对多关系

    private static final long serialVersionUID = 1L;

    public Shop() {
    }

    public Shop(Integer id, String shopName, Integer shopType, String shopPhoto, String shopPhone, String address, String operateTime, Integer operateState, String lat, String lon, Integer supportPayment, Integer shippingDistance, BigDecimal shippingPrice, Integer shippingTime, BigDecimal shippingFee, String announcement, Business business, List<Product> productList) {
        this.id = id;
        this.shopName = shopName;
        this.shopType = shopType;
        this.shopPhoto = shopPhoto;
        this.shopPhone = shopPhone;
        this.address = address;
        this.operateTime = operateTime;
        this.operateState = operateState;
        this.lat = lat;
        this.lon = lon;
        this.supportPayment = supportPayment;
        this.shippingDistance = shippingDistance;
        this.shippingPrice = shippingPrice;
        this.shippingTime = shippingTime;
        this.shippingFee = shippingFee;
        this.announcement = announcement;
        this.business = business;
        this.productList = productList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Integer getShopType() {
        return shopType;
    }

    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    public String getShopPhoto() {
        return shopPhoto;
    }

    public void setShopPhoto(String shopPhoto) {
        this.shopPhoto = shopPhoto;
    }

    public String getShopPhone() {
        return shopPhone;
    }

    public void setShopPhone(String shopPhone) {
        this.shopPhone = shopPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public Integer getOperateState() {
        return operateState;
    }

    public void setOperateState(Integer operateState) {
        this.operateState = operateState;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public Integer getSupportPayment() {
        return supportPayment;
    }

    public void setSupportPayment(Integer supportPayment) {
        this.supportPayment = supportPayment;
    }

    public Integer getShippingDistance() {
        return shippingDistance;
    }

    public void setShippingDistance(Integer shippingDistance) {
        this.shippingDistance = shippingDistance;
    }

    public BigDecimal getShippingPrice() {
        return shippingPrice;
    }

    public void setShippingPrice(BigDecimal shippingPrice) {
        this.shippingPrice = shippingPrice;
    }

    public Integer getShippingTime() {
        return shippingTime;
    }

    public void setShippingTime(Integer shippingTime) {
        this.shippingTime = shippingTime;
    }

    public BigDecimal getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(BigDecimal shippingFee) {
        this.shippingFee = shippingFee;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", shopName='" + shopName + '\'' +
                ", shopType=" + shopType +
                ", shopPhoto='" + shopPhoto + '\'' +
                ", shopPhone='" + shopPhone + '\'' +
                ", address='" + address + '\'' +
                ", operateTime='" + operateTime + '\'' +
                ", operateState=" + operateState +
                ", lat='" + lat + '\'' +
                ", lon='" + lon + '\'' +
                ", supportPayment=" + supportPayment +
                ", shippingDistance=" + shippingDistance +
                ", shippingPrice=" + shippingPrice +
                ", shippingTime=" + shippingTime +
                ", shippingFee=" + shippingFee +
                ", announcement='" + announcement + '\'' +
                ", business=" + business +
                ", productList=" + productList +
                '}';
    }
}