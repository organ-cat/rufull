package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 购物车条目类
 */
public class CartItem implements Serializable {

    private Product product;

    private int quantity;

    private BigDecimal total;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
        calculateTotal();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        calculateTotal();
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * 增加数量
     */
    public void increaseQuantity() {
        quantity++;
        calculateTotal();
    }

    /**
     * 计算条目总额
     */
    private void calculateTotal() {
        if (product != null && product.getPrice() != null) {
            total = product.getPrice().multiply(new BigDecimal(String.valueOf((quantity))));
        } else {
            total = null;
        }
    }
}
