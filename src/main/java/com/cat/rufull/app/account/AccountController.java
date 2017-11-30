package com.cat.rufull.app.account;

import com.aliyuncs.exceptions.ClientException;
import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Resource
    private AccountService accountService;

    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "account/register";
    }

    @RequestMapping("/register")
    public String register(){
        return "hello";
    }
    @RequestMapping("/send")
    public String send(){
        Email.sendBing(mailSender, mailMessage,"thisjiang@sina.com");
        return "account/send";
    }
    @RequestMapping("/sms")
    public String sendSMS(){
        try {
            SMS.sendSMS("13413600394",1234);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return "account/sms";
    }

}
