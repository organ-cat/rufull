package com.cat.rufull.app.account;

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

    @RequestMapping("/register")
    public String register(){
        return "account/register";
    }

    @RequestMapping("/sendEmail")
    public String sendEmail(){
//        EmailUtil.send(mailSender,mailMessage);
        return "account/sendEmail";
    }
}
