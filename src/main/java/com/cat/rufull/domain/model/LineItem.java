package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单项类
 */
public class LineItem implements Serializable {
    private Integer id;         // 主键

    private String productName; // 商品名

    private BigDecimal price;   // 单价

    private Integer quantity;   // 数量

    private Integer orderId;    // 订单id

    private Integer productId;  // 商品id

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
        this.productName = productName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }
}
