package com.cat.rufull.domain.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

/**
 * 购物车类
 */
public class Cart implements Serializable {

    private final Map<Integer, CartItem> itemMap = Collections
            .synchronizedMap(new HashMap<Integer, CartItem>());

    private final List<CartItem> itemList = new ArrayList<CartItem>();

    public Iterator<CartItem> getCartItems() {
        return itemList.iterator();
    }

    public List<CartItem> getCartItemList() {
        return itemList;
    }

    /**
     * 得到所有商品的数量
     * @return
     */
    public int getNumberOfItems() {
        return itemList.size();
    }

    public boolean containsProductId(Integer productId) {
        return itemMap.containsKey(productId);
    }

    /**
     * 新增购物车条目
     * @param product
     */
    public void addItem(Product product) {
        CartItem cartItem = itemMap.get(product.getId());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(0);
            itemMap.put(product.getId(), cartItem);
            itemList.add(cartItem);
        }
        cartItem.increaseQuantity();
    }

    /**
     * 增加购物车条目数量
     * @param productId
     */
    public void increaseQuantityById(String productId) {
        CartItem cartItem = itemMap.get(productId);
        cartItem.increaseQuantity();
    }

    /**
     * 移除购物车条目
     * @param productId
     */
    public Product removeItemById(String productId) {
        CartItem cartItem = itemMap.remove(productId);
        if (cartItem == null) {
            return null;
        } else {
            itemList.remove(cartItem);
            return cartItem.getProduct();
        }
    }

    /**
     * 修改购物车条目数量
     * @param productId
     * @param quantity
     */
    public void setQuantityById(String productId, int quantity) {
        CartItem cartItem = itemMap.get(productId);
        cartItem.setQuantity(quantity);
    }

    /**
     * 得到购物车小计
     * @return
     */
    public BigDecimal getSubTotal() {
        BigDecimal subTotal = new BigDecimal("0");

        Iterator<CartItem> items = getCartItems();
        while (items.hasNext()) {
            CartItem cartItem = (CartItem) items.next();
            Product product = cartItem.getProduct();
            BigDecimal price = product.getPrice();
            BigDecimal quantity = new BigDecimal(String.valueOf(cartItem
                    .getQuantity()));
            subTotal = subTotal.add(price.multiply(quantity));
        }
        return subTotal;
    }
}
