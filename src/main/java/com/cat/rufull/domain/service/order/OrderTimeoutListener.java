package com.cat.rufull.domain.service.order;

import com.cat.rufull.domain.model.Order;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;

//public class OrderTimeoutListener implements MessageListener {
//
//    private OrderService orderService;
//
//    @Override
//    public void onMessage(Message message) {
//        try {
//            Integer id = Integer.valueOf(new String(message.getBody(), "UTF-8"));
//            Order order = orderService.findOrderById(id);
//            if (Order.STATUS_UNPAID.equals(order.getStatus())) {
//                orderService.cancelOrder(order);
//            }
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Autowired
//    public void setOrderService(OrderService orderService) {
//        this.orderService = orderService;
//    }
//}

public class OrderTimeoutListener {}