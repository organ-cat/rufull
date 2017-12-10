package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.util.*;

public class Carts implements Serializable {
    private Map<Integer, Cart> cartMap = Collections
            .synchronizedMap(new HashMap<Integer, Cart>()); // key:商店id, value:购物车

    private final List<Cart> cartList = new ArrayList<Cart>();

    public Map<Integer, Cart> getCartMap() {
        return cartMap;
    }

    public void setCartMap(Map<Integer, Cart> cartMap) {
        this.cartMap = cartMap;
    }

    public List<Cart> getCartList() {
        return cartList;
    }

    /**
     * 根据商店获取购物车
     *
     * @param shopId
     * @return
     */
    public Cart getCart(Integer shopId) {
        return cartMap.get(shopId);
    }

    /**
     * 新增对应商店的购物车
     *
     * @param cart
     */
    public void addCart(Integer shopId, Cart cart) {
        cartMap.put(shopId, cart);
        cartList.add(cart);
    }

    /**
     * 清空对应商店的购物车
     *
     * @param shopId
     */
    public void clearCart(Integer shopId) {
        Cart cart = cartMap.remove(shopId);
        cartList.remove(cart);
    }

    /**
     * 清空所有购物车
     */
    public void clearAllCart() {
        cartMap.clear();
        cartList.clear();
    }


    /**
     * 返回购物车中的所有商店id
     * @return
     */
    public Iterable<Integer> keys() {
        return cartMap.keySet();
    }
}
