package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.model.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;

public class OrderTimeoutListener implements MessageListener {
    private static Logger logger = LoggerFactory.getLogger(OrderTimeoutListener.class);

    private OrderService orderService;

    @Override
    public void onMessage(Message message) {
        try {
            Integer id = Integer.valueOf(new String(message.getBody(), "UTF-8"));
            Order order = orderService.findOrderById(id);
            if (Order.STATUS_UNPAID.equals(order.getStatus())) {
                orderService.cancelOrder(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
