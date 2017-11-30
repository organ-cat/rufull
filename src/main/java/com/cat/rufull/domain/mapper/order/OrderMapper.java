package com.cat.rufull.domain.mapper.order;


import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;

import java.util.List;

public interface OrderMapper {
    // 内容:
    //  下单时间
    //  下单内容:商店名,商店图片,每个订单项的商品名和数量,总商品数量(统计得出),订单号
    //  支付金额:总额,支付方式
    //  订单状态
    public List<Order> findOrderByAccountId(Integer accountId);

    // 用订单号查订单详情
    // 内容:
    //  商店名,商店图片,订单号,商家电话,订单内容
    public Order findOrderById(Integer id);

    public void updateOrder(Order order);

    public void insertOrder(Order order);
}