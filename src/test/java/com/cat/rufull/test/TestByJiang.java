package com.cat.rufull.test;


import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.AddressService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class TestByJiang {
    @Autowired
    private AccountService accountService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;


    @Test
    public void login() {
        Account account = new Account();
        account.setPassword("123456");
        account.setUsername("jiang");
        account.setPhone("");
        account.setEmail("");
        Account login = accountService.login(account);
        System.out.println("登陆后的：" + login.toString());
    }
    @Test
    public void register(){
        Account account = new Account();
        account.setPassword("123456");
        account.setPhone("setPhone");
        account.setEmail("setEmail");
        account.setRegisterTime(new Date());
        accountService.register(account);
    }

}
