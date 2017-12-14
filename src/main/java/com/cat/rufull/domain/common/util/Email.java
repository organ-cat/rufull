package com.cat.rufull.domain.common.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Email {
    /**
     * 发送绑定邮箱的邮件
     * @param mailSender
     * @param mailMessage
     * @param to
     */
    public static void sendBing(MailSender mailSender, SimpleMailMessage mailMessage, String to) {
        mailMessage.setTo(to);//发送的到对应的邮箱
        mailMessage.setSubject("吃货宝智能订餐系统");//邮箱的标题
        mailMessage.setText("\"<h3>\n" +
                "\t\t来自广东海洋大学体育馆管理系统官方激活邮件!点下面链接完成激活操作!\n" +
                "\t</h3>\n" +
                "\t<h5>\n" +
                "\t\t<a href='http://localhost:8080/rufull/'>\n" +
                "\t\t\t点击我就就可以绑定邮箱了！\n" +
                "\t\t</a>\n" +
                "\t</h5>\n" +
                "\t\", \"text/html;charset=UTF-8\"");//邮箱的内容，暂时没有实现
        mailSender.send(mailMessage);//发送邮箱
    }
}
