package com.cat.rufull.domain.mapper.order;


import com.cat.rufull.domain.model.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    // 查询用户的所有订单
    // 内容:
    //  下单时间
    //  下单内容:商店名,商店图片,每个订单项的商品名和数量,总商品数量(统计得出),订单号
    //  支付金额:总额,支付方式
    //  订单状态
    public List<Order> findOrderByAccountId(Map<String, Object> map);

    // 用id查询订单详情
    // 内容:
    //  商店名,商店图片,商家电话,订单包含的内容,地址
    public Order findOrderById(int id);

    // 更新订单
    // 更新内容:完成时间,接单时间,订单状态,支付状态,送货状态,
    public void updateOrder(Order order);

    // 插入订单
    public void insertOrder(Order order);

    List<Order> findOrdersBetween(Map<String, Object> map);
}