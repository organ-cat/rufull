package com.cat.rufull.test;


import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.*;
import com.cat.rufull.domain.service.favor.FavorService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
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
    private ComplaintService complaintService;
    @Autowired
    private FootprintService footprintService;
    @Autowired
    private LoginLogService loginLogService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;
    @Autowired(required=true)
    private FavorService favorService;

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
    }

    ;

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
        int address = addressService.findAddressCount(account_id);
        System.out.println(address);
    }

    @Test
    public void deleteAddressById() {
        int id = 2;
        addressService.deleteAddressById(id);
    }

    @Test
    public void updateAddress() {
        Address address = new Address();
        address.setId(3);
        address.setReceiver("江");
        address.setPhone("22222222222");
        address.setLocation("中国中国");
        address.setDetail("广东广东");
        address.setStatus(1);
        address.setAccountId(1);
        addressService.updateAddress(address);
    }

    //    **************************************************************************************************************/
//投诉测试
//    **************************************************************************************************************/
   @Test
    public void findComplaintById(){
       Complaint complaintById = complaintService.findComplaintById(20);
       System.out.println(complaintById.toString());
   }

    @Test
    public void completedComplaintList(){
        List<Complaint> list = complaintService.completedComplaintList();
        for (Complaint complaint : list) {
            System.out.println(complaint.toString());
        }
    }

    @Test
    public void findComplaintByTime(){
        List<Complaint> list = complaintService.findComplaintByTime(null,null,null);
        for (Complaint complaint : list) {
            System.out.println(complaint.toString());
        }
    }
    @Test
    public void findAllComplaint(){
        List<Complaint> list = complaintService.findAllComplaint();
        for (Complaint complaint : list) {
            System.out.println(complaint.toString());
        }
    }

//    **************************************************************************************************************/
//足迹测试
//    **************************************************************************************************************/

    @Test
    public void addFootprint() {
        Footprint footprint = new Footprint();
        footprint.setAccessTime(new Date());
        footprint.setAccountId(1);
        footprint.setShopId(1);
        footprintService.addFootprint(footprint);
    }

    @Test
    public void deleteFootprint() {
        int accountId = 1;
        int shopId = 2;
        footprintService.deleteFootprint(accountId, shopId);
    }

    @Test
    public void findFootprintList() {
        int account_id = 1;
        List<Footprint> footprints = footprintService.findFootprintList(account_id);
        for (Footprint f : footprints) {
            System.out.println(f.toString());
        }
    }

//    **************************************************************************************************************/
//异地登陆测试
//    **************************************************************************************************************/

    @Test
    public void addLoginLog() {
        LoginLog log = new LoginLog();
        log.setAccountId(1);
        log.setIp("127.0.0.1");
        log.setLocation("广东湛江");
        log.setLoginTime(new Date());
        loginLogService.addLoginLog(log);
    }

    @Test
    public void fingLoginLogList() {
        int account_id = 8;
        List<LoginLog> logList = loginLogService.fingLoginLogList(account_id);
        System.out.println(logList == null);
        boolean flag = false;
        for (LoginLog log : logList) {
            System.out.println(log.toString());
            if (log.getLocation().equals("广东湛江")) {
                flag = true;
            }
        }
        if (flag) {
            System.out.println("可以可以可以可以可以可以可以可以");
        } else {
            System.out.println("不不不不不不不不不不不不不不不不");
        }
    }


    @Test
    public void uuid() {
        System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
        System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
        System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
        System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
    }

    @Test
    public void json() {
        String email = "email";
        String password = "password";
        String phone = "password";
        String username = "password";
        String json = "{ \"email\": \"" + email + "\",\"password\": \"" + password + "\", \"phone\": \"" + phone + "\",\"username\": \"" + username + "\"}";
        Gson gson = new Gson();
        Account account = gson.fromJson(json, Account.class);
        System.out.println(account.toString());
    }

    @Test
    public void findfootprint() {
        List<Footprint> footprintList = footprintService.findFootprintList(1);
        Footprint footprint = footprintList.get(0);

        Footprint footprint1 = footprintList.get(1);

        System.out.println("0" + footprint.toString());
        System.out.println("1" + footprint1.toString());

    }

    @Test
    public void completedComplaint() {
        Complaint complaint = new Complaint();
        complaint.setId(1);
        complaint.setResult(9);
        complaint.setCompletedTime(new Date());
        complaint.setSolver(1);
        complaint.setStatus(9);
        int id = 1;
        int status = 777;
        int handlering = complaintService.handlerComplaint(id, status);
        System.out.println("处理过程结果——" + handlering);
        int handerResult = complaintService.completedComplaint(complaint);
        System.out.println("处理结果——" + handerResult);
    }

    /*************************************************************************************************/
//大哥的测试
    @Test
    public void mredelAccount(){
        int id = 5;
        int isSuccess = accountService.mredelAccount(id);
        System.out.println("恢复删除——"+isSuccess);
    }

    @Test
    public void findAllAccount() {
        List<Account> list = accountService.findAllAccount();
        for (Account account : list) {
            System.out.println(account.toString());
        }
    }

    @Test
    public void mUpdateAccount() {
        Account account = new Account();
        account.setId(8);
        account.setUsername("大哥");
        account.setPhone("12345678910");
        account.setEmail("qqqqqq@qq.com");
        account.setPassword("setPassword");
        int result = accountService.mUpdateAccount(account);
        System.out.println("mUpdateAccount执行结果" + result);
    }

    @Test
    public void mdelAccount() {
        int id = 9;
        int result = accountService.mdelAccount(id);
        System.out.println("mUpdateAccount执行结果" + result);
    }

    @Test
    public void findName() {
        String name = "@";
        List<Account> list = accountService.findName(name);
        for (Account account : list) {
            System.out.println(account.toString());
        }
    }

    @Test
    public void select(){
        Date creatTime = new Date();
        Date complaitTime = new Date();
//        long time = 1513233656796L;
//        creatTime.setTime(time);
        System.out.println(creatTime);
        System.out.println(complaitTime);

        String content = "a";

        List<Complaint> complaints = complaintService.findComplaintByTime(null, null, content);
        for (Complaint com : complaints) {
            System.out.println(com.toString());
        }
    }
    /*************************************************************************************************/

    @Test
    public void updatePassword() {

        int id = 1;
        String newPassword = "123456";
        String oldPassword = "aaaaaa";
        boolean b = accountService.updatePassword(id, newPassword, oldPassword);
        if (b) {
            System.out.println("1111111111111111" + b);
        } else {
            System.out.println("0000000000000000" + b);
        }
    }

    @Test
    public void nickname() {
        int id = 1;
        String nickname = "nickname";
        String username = "jiang";
        accountService.updateNickname(id, nickname);
        accountService.setUsername(id, username);

    }

/***********************************************************************************************************/
//收藏
    @Test
    public void selectFavor() {
        int id = 1;
        List<Shop> shopList = new ArrayList<>();
        List<Favor> list = favorService.findShopByAccountId(1);
        System.out.println(list.size());
        for (Favor favor : list) {
            shopList.add(shopService.findById(favor.getShopId()));
        }
        for (Shop s : shopList) {
            System.out.println(s.toString());
        }
    }
    @Test
    public void deleteFavor(){
        int id = 1;
        int i = favorService.deleteByFavorId(id);
        System.out.println("删除收藏"+i);
    }

    @Test
    public void notification() {
        String phone = "13413600394";
        String name = "新健爸爸";
        String result = "成功";
        SMS.sendNotification(phone, name, result);
    }
    @Test
    public void testBalance(){
        int id = 1;
        double balance = 10.00;
        int result = accountService.updateBalance(id, balance);
        System.out.println(result);
    }

    @Test
    public void fenye(){
        PageInfo<Complaint> page = selectComplaintByPage(0, 1);
        System.out.println("getSize——"+page.getSize());
        System.out.println("getPageSize——"+page.getPageSize());
        System.out.println("getPrePage——"+page.getPrePage());
        System.out.println("getNextPage——"+page.getNextPage());
        System.out.println("getPages——"+page.getPages());


        List<Complaint> list = page.getList();
        for (Complaint complaint : list) {
            System.out.println(complaint.toString());
        }
    }

    public PageInfo<Complaint> selectComplaintByPage(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<Complaint> list = complaintService.findAccountComplaintListById(1);
        PageInfo<Complaint> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

}




