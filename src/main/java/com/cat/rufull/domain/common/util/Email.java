package com.cat.rufull.domain.common.util;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Email {

    public static void send(MailSender mailSender, SimpleMailMessage mailMessage){
        mailMessage.setTo("510146714@qq.com");
        mailMessage.setSubject("jiang");
        mailMessage.setText("newjiang");
        mailSender.send(mailMessage);
    }
}
