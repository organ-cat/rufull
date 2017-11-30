package com.cat.rufull.test;


import com.cat.rufull.domain.common.util.RegEx;
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
    public void findAccountById() {
        int id = 11;
        Account account = accountService.findAccountById(id);
        System.out.println("账户" + account.getId());
        System.out.println("账户" + account.getUsername());
        System.out.println("账户" + account.getPassword());

    }

    @Test
    public void findAccountByPhone() {
        String phone = "6632380";
        Account account = accountService.findAccountByPhone(phone);
        System.out.println("手机" + account.getId());
        System.out.println("账户" + account.getUsername());
        System.out.println("账户" + account.getPassword());

    }

    @Test
    public void findAccountByEmail() {
        String email = "jiang@qq.com";
        Account account = accountService.findAccountByEmail(email);
        System.out.println("手机" + account.getId());
        System.out.println("账户" + account.getUsername());
        System.out.println("账户" + account.getPassword());

    }

    @Test
    public void register() {
        Account account = new Account();
        account.setPhone("110");
        account.setPassword("110");
        accountService.regitser(account);
        System.out.println(account.getPhone());
        System.out.println(account.getPassword());
    }

    @Test
    public void login() {
        Account account = new Account();
        account.setPassword("123456");
//        account.setPhone("6632380");
//        account.setEmail("jiang@qq.com");
        account.setUsername("jiang");
        Account user = accountService.login(account);
        if (user == null) {
            System.out.println("没有该用户");
        } else {
            System.out.println();
            System.out.println("账户" + user.toString());
            System.out.println();
        }
    }

    @Test
    public void update() {
        Account account = new Account();
        account.setId(16);
        account.setPhoto("http:www.baidu.com");
        accountService.updateAccountPhoto(account);
    }

    @Test
    public void updateNickname() {
        Account account = new Account();
        account.setId(1);
        account.setNickname("呢称");
        accountService.updateNickname(account);
    }

    @Test
    public void queryAddressById() {
        Address address = new Address();
        address.setId(1);
        Address address1 = addressService.queryAddressById(address);
        System.out.println("详细地址——" + address1.toString());
    }

    @Test
    public void queryAddress() {
        Account account = new Account();
        account.setId(1);
        List<Address> addresses = addressService.queryAddress(account);

        for (Address address : addresses) {
            System.out.println("详细地址——" + address.toString());
        }
    }

    @Test   //根据id查询个人总的地址数量
    public void queryAddressCount() {
        Account account = new Account();
        account.setId(1);
        int count = addressService.queryAddressCount(account);
        System.out.println("详细地址总数——" + count);
    }

    @Test   //修改地址
    public void updateAddress() {
        Address address = new Address();
        address.setId(1);
        address.setAccountId(1);
        address.setReceiver("中国");
        address.setPhone("119");
        address.setLocation("中国");
        address.setDetail("广东");
        address.setStatus(1);
        addressService.updateAddress(address);

        queryAddress();
    }

    @Test   //添加地址
    public void addAddress() {
        Address address = new Address();
        address.setReceiver("钟儿子");
        address.setPhone("12345678990");
        address.setLocation("佛山顺德");
        address.setDetail("xx村");
        address.setStatus(1);
        address.setAccountId(2);
        addressService.addAddress(address);
    }


    @Test
    public void deleteAddress(){
        Address address = new Address();
        address.setId(1);
        addressService.deleteAddress(address);
    }
    @Test
    public void regular(){
//        String phone = "13413000394";
//        boolean b = RegEx.regExPhone(phone);
//
//        String username = "1mn ";
//        boolean b1 = RegEx.regExUsername(username);

        String emial = "jias@163.com";
        boolean b2 = RegEx.regExEmail(emial);
        if (b2) {
            System.out.println("是是是是是是是是是是是是是是是是是是是是是是是");
        } else {
            System.out.println("否否否否否否否否否否否否否否否否否否否否否否否");
        }
    }


















}
