package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.model.Order;

import java.util.Date;
import java.util.List;

public interface OrderService {

    /**
     * 查询用户的所有订单
     *
     * @param accountId 用户id
     * @return orders 用户的所有订单
     */
    public List<Order> findOrderByAccountId(Integer accountId);

    /**
     * 查询用户的所有待评价订单
     *
     * @param accountId 用户id
     * @return orders 用户的待评价订单
     */
    List<Order> findUnratedOrderByAccountId(Integer accountId);

    /**
     * 查询用户的所有退单记录
     *
     * @param accountId 用户id
     * @return orders 用户的所有退单记录
     */
    List<Order> findRefundOrderByAccountId(Integer accountId);

    /**
     * 查询订单详情
     *
     * @param id 订单id
     * @return 订单详情
     */
    public Order findOrderById(Integer id);

    /**
     * 取消订单
     *
     * @param order 订单
     */
    public void cancelOrder(Order order);

    /**
     * 催单
     *
     * @param order 订单
     */
    public void urgeOrder(Order order);

    /**
     * 退单
     *
     * @param order 订单
     */
    public void refundOrder(Order order);

    /**
     * 取消退单
     *
     * @param order 订单
     */
    public void cancelRefundOrder(Order order);

    /**
     * 确认收货
     *
     * @param order 订单
     */
    public void confirmOrder(Order order);

    /**
     * 下单
     *
     * @param order 包括商家信息的订单
     */
    public void submitOrder(Order order);

    /**
     * 接单
     *
     * @param order 订单
     */
    public void acceptOrder(Order order);

    /**
     * 完成支付
     *
     * @param order 包括商家信息的订单
     */
    public void paidOrder(Order order);

    /**
     * 根据开始时间和结束时间查询所有订单
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    public List<Order> findOrdersBetween(Date beginDate, Date endDate);

    /**
     * 根据用户id,开始时间和结束时间查询个人订单
     *
     * @param accountId
     * @param beginDate
     * @param endDate
     * @return
     */
    public List<Order> findOrdersByAccountIdBetween(Integer accountId, Date beginDate, Date endDate);

    /**
     * 查询所有订单
     *
     * @return
     */
    public List<Order> findAllOrders();

    /**
     * 根据商店id,订单状态查询订单
     *
     * @param shopId
     * @param orderStatus
     * @return
     */
    public List<Order> findShopOrdersByStatus(Integer shopId, String orderStatus);
}
