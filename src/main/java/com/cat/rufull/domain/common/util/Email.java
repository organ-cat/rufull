package com.cat.rufull.domain.common.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Email {
    /**
     * 发送绑定邮箱的邮件的验证码
     * @param mailSender
     * @param mailMessage
     * @param to     接收邮箱的邮箱号
     */
    public static void sendBing(MailSender mailSender, SimpleMailMessage mailMessage, String to,String code) {
        //发送的到对应的邮箱
        mailMessage.setTo(to);
        //邮箱的标题
        mailMessage.setSubject("吃货宝智能订餐系统");
        //邮箱的内容
        mailMessage.setText("尊敬的客户您好，您的邮箱验证码是："+code+"，请妥善保存，切勿泄露！");
        //发送邮箱
        mailSender.send(mailMessage);
    }
}
