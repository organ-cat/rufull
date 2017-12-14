package com.cat.rufull.app.controller.message;

import com.cat.rufull.domain.model.Message;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.service.message.MessageService;
import com.cat.rufull.domain.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {

    private SimpMessagingTemplate simpMessagingTemplate;

    private MessageService messageService;

    private OrderService orderService;

    /**
     * 请求催单
     * @param applyMessage
     */
    @MessageMapping("/applyUrgeMessage")
    @SendToUser({"/receiveApplyUrgeMessage", "/receiveReplyUrgeMessage"})
    public void applyUrgeMessage(Message applyMessage) {
        messageService.insertMessage(applyMessage); // 保存请求消息

        Integer accountId = applyMessage.getSenderId(); // 获取用户id
        Integer shopId = applyMessage.getReceiverId(); // 获取商店id
        Integer orderId = applyMessage.getOrderId(); // 获取订单id

        Order order = orderService.findOrderById(orderId); // 查询订单

        if (Order.STATUS_DELIVERY.equals(order.getStatus())) { // 如果商品已送出
            applyMessage.setStatus(Message.STATUS_AUTO); // 由系统自动回复
            messageService.updateMessage(applyMessage);

            Message replyMessage = new Message(); // 创建系统回复消息

            replyMessage.setType(Message.TYPE_URGE);
            replyMessage.setContent("外卖已送出");
            replyMessage.setStatus(Message.STATUS_SEND);
            replyMessage.setOrderId(orderId);
            replyMessage.setSenderId(applyMessage.getReceiverId());
            replyMessage.setReceiverId(applyMessage.getSenderId());

            messageService.insertMessage(replyMessage); // 保存系统回复消息

            simpMessagingTemplate.convertAndSendToUser(
                    accountId.toString(),"/" + orderId + "/receiveReplyUrgeMessage", replyMessage);
        } else if (Order.STATUS_ACCEPTED.equals(order.getStatus())) { // 如果商家已接单但未送出
            // 将催单消息发送给商家
            simpMessagingTemplate.convertAndSendToUser(
                    shopId.toString(),"/" + orderId + "/receiveApplyUrgeMessage", applyMessage);
        }
    }

    /**
     * 回复催单
     * @param applyMessage
     */
    @MessageMapping("/replyUrgeMessage")
    @SendToUser("/receiveReplyUrgeMessage")
    public void replyUrgeMessage(Message applyMessage) {
        messageService.updateMessage(applyMessage); // 请求消息已读

        Integer accountId = applyMessage.getSenderId(); // 获取用户id
        Integer orderId = applyMessage.getOrderId(); // 获取订单id

        Message replyMessage = new Message(); // 创建商家回复消息

        replyMessage.setType(Message.TYPE_URGE);
        replyMessage.setContent("我们尽早发货");
        replyMessage.setStatus(Message.STATUS_SEND);
        replyMessage.setOrderId(orderId);
        replyMessage.setSenderId(applyMessage.getReceiverId());
        replyMessage.setReceiverId(applyMessage.getSenderId());

        messageService.insertMessage(replyMessage); // 保存商家回复消息

        // 将回复消息发送给用户
        simpMessagingTemplate.convertAndSendToUser(
                accountId.toString(),"/" + orderId + "/receiveReplyUrgeMessage", replyMessage);
    }

    @Autowired
    public void setSimpMessagingTemplate(SimpMessagingTemplate simpMessagingTemplate) {
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    @Autowired
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
