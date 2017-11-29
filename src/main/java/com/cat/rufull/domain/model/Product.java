package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class Product implements Serializable {
    private Integer id;                 // 商品主键id

    private String productName;         // 商品名称

    private BigDecimal price;           // 商品价格

    private Integer status;             // 商品状态：还没有确定有多少个

    private Integer salesVolume;        //  销售量

    private String description;         // 商品描述

    private String photo;               // 商品照片

    private Shop shop;                  // 商店与商品1对1关系

    public Product() {
    }

    public Product(Integer id, String productName, BigDecimal price, Integer status, Integer salesVolume, String description, String photo, Shop shop, List<LineItem> lineItemList) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.status = status;
        this.salesVolume = salesVolume;
        this.description = description;
        this.photo = photo;
        this.shop = shop;
        this.lineItemList = lineItemList;
    }


    private List<LineItem> lineItemList;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Integer salesVolume) {
        this.salesVolume = salesVolume;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public List<LineItem> getLineItemList() {
        return lineItemList;
    }

    public void setLineItemList(List<LineItem> lineItemList) {
        this.lineItemList = lineItemList;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", status=" + status +
                ", salesVolume=" + salesVolume +
                ", description='" + description + '\'' +
                ", photo='" + photo + '\'' +
                ", shop=" + shop +
                ", lineItemList=" + lineItemList +
                '}';
    }
}