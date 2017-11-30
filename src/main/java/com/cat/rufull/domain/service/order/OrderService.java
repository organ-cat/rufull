package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.model.Order;

import java.util.List;

public interface OrderService {

    /**
     * 查询用户的所有订单
     * @param accountId
     * @return
     */
    public List<Order> findOrderByAccountId(int accountId);

    /**
     * 查询订单详情
     * @param id
     * @return
     */
    public Order findOrderById(int id);

    /**
     * 取消订单
     * @param order
     */
    public void cancelOrder(Order order);

    /**
     * 催单
     * @param order
     */
    public void urgeOrder(Order order);

    /**
     * 确认收货
     * @param order
     */
    public void confirmOrder(Order order);

    /**
     * 退单
     * @param order
     */
    public void withdrawOrder(Order order);

    /**
     * 下单
     * @param order
     */
    public void submitOrder(Order order);

    /**
     * 接单
     * @param order
     */
    public void acceptOrder(Order order);
}
