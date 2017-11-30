package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;


    @Override
    public List<Order> findOrderByAccountId(int accountId) {
        return null;
    }

    @Override
    public Order findOrderById(int id) {
        return null;
    }

    @Override
    public void cancelOrder(Order order) {

    }

    @Override
    public void urgeOrder(Order order) {

    }

    @Override
    public void confirmOrder(Order order) {

    }

    @Override
    public void withdrawOrder(Order order) {

    }

    @Override
    public void submitOrder(Order order) {

    }

    @Override
    public void acceptOrder(Order order) {

    }
}
