package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.List;

public class Shop implements Serializable {
    private Integer id;                         //商店id主键

    private String shopName;                    //商店名称

    private String address;                     //商店详细地址

    private String lat;                         //商店在地图上经度

    private String lon;                         //商店在地图上维度

    private Integer operateState;               //营业状态：还没有确定有多少个状态

    private String announcement;                //商店公告

    private Integer supportPayment;             //支持支付方式

    private Integer shopType;                   //商店类型

    private Integer shippingDistance;           //配送距离

    private Integer shippingPrice;              //配送起价

    private Integer shippingTime;               //配送时间

    private Business business;                  //商店与商家1对1关系

    private List<Product> productList;          //商店与商品1对多关系

    private static final long serialVersionUID = 1L;

    public Shop() {
    }

    public Shop(Integer id, String address, String lat, String lon, Integer operateState, String announcement, Integer supportPayment, Integer shopType, Integer shippingDistance, Integer shippingPrice, Integer shippingTime, Business business, String shopName, List<Product> productList) {
        this.id = id;
        this.address = address;
        this.lat = lat;
        this.lon = lon;
        this.operateState = operateState;
        this.announcement = announcement;
        this.supportPayment = supportPayment;
        this.shopType = shopType;
        this.shippingDistance = shippingDistance;
        this.shippingPrice = shippingPrice;
        this.shippingTime = shippingTime;
        this.business = business;
        this.shopName = shopName;
        this.productList = productList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat == null ? null : lat.trim();
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon == null ? null : lon.trim();
    }

    public Integer getOperateState() {
        return operateState;
    }

    public void setOperateState(Integer operateState) {
        this.operateState = operateState;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement == null ? null : announcement.trim();
    }

    public Integer getSupportPayment() {
        return supportPayment;
    }

    public void setSupportPayment(Integer supportPayment) {
        this.supportPayment = supportPayment;
    }

    public Integer getShopType() {
        return shopType;
    }

    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    public Integer getShippingDistance() {
        return shippingDistance;
    }

    public void setShippingDistance(Integer shippingDistance) {
        this.shippingDistance = shippingDistance;
    }

    public Integer getShippingPrice() {
        return shippingPrice;
    }

    public void setShippingPrice(Integer shippingPrice) {
        this.shippingPrice = shippingPrice;
    }

    public Integer getShippingTime() {
        return shippingTime;
    }

    public void setShippingTime(Integer shippingTime) {
        this.shippingTime = shippingTime;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
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


}