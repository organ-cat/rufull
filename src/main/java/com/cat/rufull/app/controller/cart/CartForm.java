package com.cat.rufull.app.controller.cart;

import java.util.Map;

public class CartForm {
    private Map<Integer, Integer> quantity;

    public void setQuantity(Map<Integer, Integer> quantity) {
        this.quantity = quantity;
    }

    public Map<Integer, Integer> getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "CartForm [quantity=" + quantity + "]";
    }
}
