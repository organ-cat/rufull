package com.cat.rufull.domain.mapper.order;


import com.cat.rufull.domain.model.Order;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderMapper {
    // 查询用户的所有订单
    // 内容:
    //  下单时间
    //  下单内容:商店名,商店图片,每个订单项的商品名和数量,总商品数量(统计得出),订单号
    //  支付金额:总额,支付方式
    //  订单状态
    List<Order> findOrdersByAccountId(Map<String, Object> map);

    // 用id查询订单详情
    // 内容:
    //  商店名,商店图片,商家电话,订单包含的内容,地址
    Order findOrderById(int id);

    /**
     * 用订单号查询订单详情
     *
     * @param orderNumber
     * @return
     */
    Order findOrderByOrderNumber(String orderNumber);

    // 更新订单
    // 更新内容:完成时间,接单时间,订单状态,支付状态,送货状态,
    void updateOrder(Order order);

    // 插入订单
    void insertOrder(Order order);

    List<Order> findOrdersBetween(Map<String, Object> map);

    List<Order> findOrdersByAccountIdBetween(Map<String, Object> map);

    List<Order> findAllOrders();

    List<Order> findShopOrdersByStatus(@Param("shopId") Integer shopId, @Param("orderStatus") String orderStatus);

    List<Order> findBusinessOrdersByStatus(@Param("businessId") Integer businessId, @Param("orderStatus") String orderStatus);

    /**
     * 商家当月订单数
     *
     * @param shopId
     * @param today
     * @param lastMonthToday
     * @return
     */
    Integer getMonthlySales(@Param("shopId") Integer shopId,
                            @Param("today") Date today,
                            @Param("lastMonthToday") Date lastMonthToday);

    /**
     * 商家当月订单总额
     *
     * @param shopId
     * @param today
     * @param lastMonthToday
     * @return
     */
    BigDecimal getMonthlyTotal(@Param("shopId") Integer shopId,
                               @Param("today") Date today,
                               @Param("lastMonthToday") Date lastMonthToday);
}