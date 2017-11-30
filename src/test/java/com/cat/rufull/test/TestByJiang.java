package com.cat.rufull.test;

import com.cat.rufull.domain.common.util.RegEx;
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

import java.text.SimpleDateFormat;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
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

    @Test   //修改昵称
    public void updateNickname() {
        Account account = new Account();
        account.setId(1);
        account.setNickname("哈哈哈哈哈哈");
        accountService.updateNickname(account);
    }

    @Test   //修改头像
    public void updatePhoto(){
        Account account = new Account();
        account.setId(1);
        account.setPhoto("wwwwwwwwwwwwwwwwwwww");
        accountService.updateAccountPhoto(account);

    }

    @Test   //用户注册
    public void register(){
        String phone = "13413600111";
        String email = null;
        String password = "password";
        boolean isPhone = RegEx.regExPhone(phone);
        boolean isEmail = RegEx.regExEmail(email);
        Account account = new Account();
        account.setRegisterTime(new Date());
        account.setPassword(password);
        if (isPhone) {
            account.setPhone(phone);
        }
        if (isEmail) {
            account.setEmail(email);
        }
        accountService.register(account);
    }
    @Test
    public void testTime(){
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String format = simpleDateFormat.format(new java.util.Date());
//        System.out.println("测试时间"+format);
        System.out.println("测试时间"+new java.util.Date());
    }
}
