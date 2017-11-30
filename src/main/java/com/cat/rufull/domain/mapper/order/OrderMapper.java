package com.cat.rufull.domain.mapper.order;


import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;

import java.util.List;

public interface OrderMapper {
    public List<Order> findOrderByAccountId(Integer accountId);

    public Order findOrderById(Integer id);

    public void updateOrder(Order order);

    public void insertOrder(Order order);
}