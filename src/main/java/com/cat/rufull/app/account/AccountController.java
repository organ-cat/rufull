package com.cat.rufull.app.account;

import com.aliyuncs.exceptions.ClientException;
import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.service.account.IAccountService;
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
    private IAccountService accountService;

    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;

    @RequestMapping("/registerpage")
    public void registerPage(){

    }
    @RequestMapping("/register")
    public String register(){

        return "account/register";
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
