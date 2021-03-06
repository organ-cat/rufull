package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.model.Order;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface OrderService {

    /**
     * 查询用户的所有订单
     *
     * @param accountId 用户id
     * @return orders 用户的所有订单
     */
    List<Order> findOrderByAccountId(Integer accountId);

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
    Order findOrderById(Integer id);

    /**
     * 查询订单详情
     *
     * @param orderNumber 订单号
     * @return 订单详情
     */
    Order findOrderByOrderNumber(String orderNumber);

    /**
     * 取消订单
     *
     * @param order 订单
     */
    void cancelOrder(Order order);

    /**
     * 退单
     *
     * @param order 订单
     */
    void refundOrder(Order order);

    /**
     * 确认退单
     * @param order 订单
     */
    void confirmRefund(Order order);

    /**
     * 取消退单
     *
     * @param order 订单
     */
    void cancelRefundOrder(Order order);

    /**
     * 确认收货
     *
     * @param order 订单
     */
    void confirmOrder(Order order);

    /**
     * 下单
     *
     * @param order 包括商家信息的订单
     */
    void submitOrder(Order order);

    /**
     * 接单
     *
     * @param order 订单
     */
    void acceptOrder(Order order);

    /**
     * 发货
     *
     * @param order 订单
     */
    void deliverOrder(Order order);

    /**
     * 完成支付
     *
     * @param order 包括商家信息的订单
     */
    void paidOrder(Order order);

    /**
     * 根据开始时间和结束时间查询所有订单
     *
     * @param beginDate
     * @param endDate
     * @return
     */
    List<Order> findOrdersBetween(Date beginDate, Date endDate);

    /**
     * 根据用户id,开始时间和结束时间查询个人订单
     *
     * @param accountId
     * @param beginDate
     * @param endDate
     * @return
     */
    List<Order> findOrdersByAccountIdBetween(Integer accountId, Date beginDate, Date endDate);

    /**
     * 查询所有订单
     *
     * @return
     */
    List<Order> findAllOrders();

    /**
     * 根据商店id,订单状态查询订单
     *
     * @param shopId
     * @param orderStatus
     * @return
     */
    List<Order> findShopOrdersByStatus(Integer shopId, String orderStatus);

    /**
     * 查询商家已接订单
     *
     * @param shopId
     * @return
     */
    List<Order> findShopAcceptedOrders(Integer shopId);

    /**
     * 查询商家退单记录
     *
     * @param shopId
     * @return
     */
    List<Order> findShopRefundOrders(Integer shopId);

    /**
     * 查询商家完成订单
     *
     * @param shopId
     * @return
     */
    List<Order> findShopCompletedOrders(Integer shopId);

    /**
     * 根据商家id,订单状态查询订单
     * @param businessId
     * @param orderStatus
     * @return
     */
    List<Order> findBusinessOrdersByStatus(Integer businessId, String orderStatus);

    /**
     * 商家当月订单数
     * @param shopId
     * @return
     */
    Integer getMonthlySales(Integer shopId);

    /**
     * 商家当月订单总额
     * @param shopId
     * @return
     */
    BigDecimal getMonthlyTotal(Integer shopId);
}
