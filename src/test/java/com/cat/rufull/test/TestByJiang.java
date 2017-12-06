package com.cat.rufull.test;


import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Address;
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
import java.util.UUID;

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
    public void register() {
        Account account = new Account();
        account.setPassword("123456");
        account.setPhone("setPhone");
        account.setEmail("setEmail");
        account.setRegisterTime(new Date());
        accountService.register(account);
    }

    @Test
    public void setUsername() {
        Account account = new Account();
        account.setUsername("ahhhhhhh");
        accountService.setUsername(account);

    }
    @Test
    public void UUid() {
        for (int i = 0; i < 10; i++) {
            String s = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println("UUID   ---   " + s);
        }
    }

    @Test
    public void fingUser() {
        Account accountByPhone = accountService.findAccountByPhone("13413600394", 2);
        Account account = accountService.findAccountByEmail("jiang@qq.com", 1);
        if (account == null) {
            System.out.println("000000000000000000000000000");
        } else {
            System.out.println(account.toString());
        }
    }
    @Test
    public void checkUsername() {
        Account account = accountService.findAccountByUsername("jiang", 1);
        System.out.println();
        if (account != null) {
            System.out.println(account.toString());
        } else {
            System.out.println("?????????????????????????????????????");
        }
        System.out.println();
    }


//    **************************************************************************************************************/
//地址测试
//    **************************************************************************************************************/

    @Test
    public void addAddress() {
        Address address = new Address();
        address.setReceiver("江");
        address.setPhone("111111111111");
        address.setLocation("中国中国");
        address.setDetail("广东广东");
        address.setStatus(1);
        address.setAccountId(1);
        addressService.addAddress(address);
    };

   @Test
    public void queryAddressList() {
        List<Address> addressList = addressService.queryAddressList(2);
        for (Address a : addressList) {
            System.out.println(a.toString());
        }
    }

    @Test
    public void findAddressById() {
        int id = 2;
        Address address = addressService.findAddressById(id);
        System.out.println(address.toString());
    }

    @Test
    public void findAddressCount() {
        int account_id = 2;
        int  address = addressService.findAddressCount(account_id);
        System.out.println(address);
    }


}
