package com.cat.rufull.app.controller.message;

import com.cat.rufull.domain.model.Message;
import com.cat.rufull.domain.service.message.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {

    private SimpMessagingTemplate simpMessagingTemplate;

    private MessageService messageService;

    /**
     * 请求催单
     * @param message
     */
    @MessageMapping("/applyUrgeMessage")
    @SendToUser("/receiveApplyUrgeMessage")
    public void applyUrgeMessage(Message message) {
        messageService.insertMessage(message);

        String shopId = message.getReceiverId().toString();
        Integer orderId = message.getOrderId();

        simpMessagingTemplate.convertAndSendToUser(
                shopId,"/" + orderId + "/receiveApplyUrgeMessage", message);
    }

    /**
     * 回复催单
     * @param message
     */
    @MessageMapping("/replyUrgeMessage")
    @SendToUser("/receiveReplyUrgeMessage")
    public void replyUrgeMessage(Message message) {
        messageService.updateMessage(message);

        String accountId = message.getSenderId().toString();
        Integer orderId = message.getOrderId();

        simpMessagingTemplate.convertAndSendToUser(
                accountId,"/" + orderId + "/receiveReplyUrgeMessage", message);
    }

    @Autowired
    public void setSimpMessagingTemplate(SimpMessagingTemplate simpMessagingTemplate) {
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    @Autowired
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
}
