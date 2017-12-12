package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.common.util.ReturnCode;
import com.cat.rufull.domain.common.util.RufullCookie;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Footprint;
import com.cat.rufull.domain.model.LoginLog;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.FootprintService;
import com.cat.rufull.domain.service.account.LoginLogService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.google.gson.Gson;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private LoginLogService loginLogService;
    @Autowired
    private FootprintService footprintService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;

    //登陆成功页面——测试使用
    @RequestMapping("/loginSuccess")
    public String loginSuccess(){
        return "account/loginSuccess";
    }

    //跳转到个人中心，显示个人信息和浏览过的商家足迹
    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public ModelAndView center(@RequestParam("id") int id, HttpSession session) {
        //获取用户足迹集合
        List<Footprint> footprintList = footprintService.findFootprintList(id);
        //用户浏览过的商店集合
        List<Shop> shopList = new ArrayList<>();
        ModelAndView view = new ModelAndView();
        for (Footprint footprint : footprintList) {
            shopList.add(shopService.findById(footprint.getShopId()));
        }
        view.addObject(Footprint.FOOTPRINT_LIST, shopList);
        view.setViewName("account/login/center");
        return view;
    }
    @RequestMapping(value = "/infomation", method = RequestMethod.GET)
    public String infomation() {
        return "account/login/infomation";
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
    public String updatePassword() {
        return "account/login/updatePassword";
    }
    @RequestMapping(value = "/security", method = RequestMethod.GET)
    public String security() {
        return "account/login/security";
    }
    @RequestMapping("uploadPage")
    public String upload(){
        return "account/login/upload";
    }

    @RequestMapping(value = "/upload")
    public String uploadPhoto(@RequestParam("photo") MultipartFile photo,
                              @RequestParam("id") int id,
                              HttpServletRequest request,
                              HttpSession session) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        String path = request.getServletContext().getRealPath("upload/account");
        String fileName = "A" + id + photo.getOriginalFilename();
        if (!fileName.equalsIgnoreCase("A" + id)) {
            try {
                FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        accountService.updateAccountPhoto(id, fileName);
        account.setPhoto(fileName);
        session.setAttribute(Account.ACCOUNT_SESSION, account);
        return "account/login/infomation";
    }




//测试使用的视图，待商家模块完成后转移过去
    @RequestMapping(value = "/showshowshow", method = RequestMethod.GET)
    public ModelAndView addFootprint(@RequestParam("shopId") int shopId , @RequestParam("accountId") int accountId) {
        //添加浏览的足迹
        footprintService.addFootprint(new Footprint(null, new Date(), accountId, shopId));
        //下面是作废代码
        Shop shop = shopService.findById(shopId);
        ModelAndView view = new ModelAndView();
        view.setViewName("account/test");
        view.addObject("shop", shop);
        return view;
    }
    @RequestMapping("/deleteFootprint")
    public ModelAndView deleteFootprint(@RequestParam("accountId") int accountId, @RequestParam("shopId") int shopId) {
        //根据用户id和商店id删除足迹,返回删除后的集合
        List<Footprint> footprints = footprintService.deleteFootprint(accountId, shopId);
        ModelAndView view = new ModelAndView();
        List<Shop> shopList = new ArrayList<>();
        for (Footprint footprint : footprints) {
            shopList.add(shopService.findById(footprint.getShopId()));
        }
        view.setViewName("account/login/center");
        view.addObject(Footprint.FOOTPRINT_LIST, shopList);
        return view;
    }
    //已测试，但未完成
    @RequestMapping("/setUsername")
    public String setUsername(@RequestParam("username") String username, HttpSession session) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setUsername(username);
        accountService.setUsername(account);
        return "account/loginSuccess";
    }
    //绑定手机号，已测试，但未完成
    @RequestMapping("/bindPhone")
    public String bindPhone(@RequestParam("phone") String phone, HttpSession session){
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setPhone(phone);
        accountService.bindPhone(account);
        return "account/loginSuccess";
    }
    //绑定邮箱，已测试，但未完成
    @RequestMapping("/bindEmail")
    public String bindEmail(@RequestParam("email") String email, HttpSession session){
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setEmail(email);
        accountService.bindEmail(account);
        return "account/loginSuccess";
    }
    /**
     * 退出的功能
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        //获取用户的cookie
        Cookie[] cookies = request.getCookies();
        if (null != cookies){
            for (Cookie cookie : cookies) {
                //判断是否存在rufullCookie，即本网站的cookie
                if (cookie.getName().equals(RufullCookie.RUFULLCOOKIE)) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);// 立即销毁cookie
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    break;
                }
            }
        }
        session.invalidate();
        return "index";
    }

    /**
     * 用户注册
     * @param phoneOrEmail  用户的注册方式，可以手机/邮箱
     * @param password      用户注册使用的密码
     * @param checkCode     用户注册的验证码
     * @param httpSession   HttpSession
     * @return               注册后的视图
     */
    @RequestMapping(value = "/accountRegister",method = RequestMethod.POST)
    public String accountRegister(@RequestParam("phone") String phoneOrEmail,
                           @RequestParam("password") String password,
                           @RequestParam("checkCode") String checkCode,
                           HttpSession httpSession) {
        return register(phoneOrEmail, password, checkCode, httpSession, Account.ACCOUNT_ROLE);
    }
    /**
     * 商家注册
     * @param phoneOrEmail  用户的注册方式，可以手机/邮箱
     * @param password      用户注册使用的密码
     * @param checkCode     用户注册的验证码
     * @param httpSession   HttpSession
     * @return               注册后的视图
     */
    @RequestMapping(value = "/businessRegister", method = RequestMethod.POST)
    public String businessRegister(@RequestParam("phone") String phoneOrEmail,
                                   @RequestParam("password") String password,
                                   @RequestParam("checkCode") String checkCode,
                                   HttpSession httpSession,
                                   HttpServletRequest request,
                                   Model model) {
        return register(phoneOrEmail, password, checkCode, httpSession, Account.BUSINESS_ROLE);
    }
    /**
     * 用户登陆
     *
     * @param username   用户登陆的方式，可以是用户名/手机/邮箱
     * @param password   登陆的密码
     * @param ip         登陆的IP
     * @param city       登陆的位置具体是xx省xx市
     * @param remoteCode 异地登陆的验证码
     * @param session    HttpSession
     * @param response   HttpServletResponse
     */
    @RequestMapping(value = "/accountLogin", method = RequestMethod.POST)
    public void accountLogin(@RequestParam("username") String username, @RequestParam("password") String password,
                             @RequestParam("ip") String ip, @RequestParam("city") String city,
                             @RequestParam("remoteCode") String remoteCode,
                             HttpSession session, HttpServletResponse response) {
        loginCheckIsRemote(username, password, Account.ACCOUNT_ROLE, ip, city,
                session, response, remoteCode, Account.ACCOUNT_SESSION, Account.REMOTE_CODE_SESSION);
    }
    /**
     * 商家登陆
     * @param username     用户登陆的方式，可以是用户名/手机/邮箱
     * @param password     登陆的密码
     * @param session      HttpSession
     * @param response     HttpServletResponse
     */
    @RequestMapping(value = "/businessLogin", method = RequestMethod.POST)
    public void businessLogin(@RequestParam("username") String username, @RequestParam("password") String password,
                              HttpSession session, HttpServletResponse response) {
        login(username, password, Account.BUSINESS_ROLE, session, response, Account.BUSINESS_SESSION, null, null);
    }
    /**
     * 登陆检测异地登陆
     * @param username      用户的登陆方式，可以是用户名/手机/邮箱
     * @param password      用户登陆的密码
     * @param role           用户的角色，用户或商家
     * @param ip             用户登陆时候的ip
     * @param city           用户登陆的位置，具体是xx省xx市
     * @param session        HttpSession
     * @param response       HttpServletResponse
     * @param remoteCode     异地登陆时候的验证码
     * @param sessionName    用户或者商家登陆时候，存入session中的名字
     * @param sessionRemoteCode    session中，异地登陆验证码中的key
     */
    public void loginCheckIsRemote(String username, String password, int role, String ip, String city,
                                   HttpSession session, HttpServletResponse response,
                                   String remoteCode, String sessionName,String sessionRemoteCode) {
        //从session中获取异地登陆的验证码
        String recode = (String) session.getAttribute(sessionRemoteCode);
        //异地登陆的验证码是空，表示第一次登陆，不需要异地登陆验证码
        if (recode == null) {
            //判断是否是异地登陆
            boolean isRemote = checkLoglog(ip, city, username, role);
            if (isRemote) {//true ，不是异地登陆
                //登陆
                this.login(username, password, role, session, response,
                        sessionName, ip, city);
            } else {//false，异地登陆
                //将异地登陆验证码赋值为uuid并放入session，防止破解
                session.setAttribute(remoteCode, UUID.randomUUID().toString().replaceAll("-", ""));
                //返回异地登陆信息，提示需要短信验证码
                returnMessage(response, ReturnCode.REMOTE_LOGIN);//异地登陆
            }
        } else {//非第一次登陆
            //判断输入的异地登陆的验证码是否正确
            if (remoteCode.equals(remoteCode)) {//正确
                this.login(username, password, role, session,
                        response, sessionName, ip, city
                );
            } else {//错误
                //返回错误信息
                returnMessage(response, ReturnCode.REMOTE_CODE_ERROR);//异地登陆验证码错误
            }
        }
    }
    /**
     * 登陆功能
     * @param username      登陆的方式，可以是用户名/手机/邮箱
     * @param password      登陆输入的密码
     * @param role           登陆的角色
     * @param session       HttpSession
     * @param response      HttpServletResponse
     * @param sessionName   登陆成功后存入的session中的名字
     * @param ip             登陆时候的IP
     * @param city           登陆时候的位置，具体是xx省xx市
     */
    public void login(String username,
                       String password,
                       int role,
                       HttpSession session,
                       HttpServletResponse response,
                       String sessionName,
                       String ip,
                       String city){
        Account account = new Account();
        //判断是否是用户名
        boolean isUsernaem = RegEx.regExUsername(username);
        //判断是否是手机
        boolean isPhone = RegEx.regExPhone(username);
        //判断是否是邮箱
        boolean isEmail = RegEx.regExEmail(username);
        //返回结果
        String result = null;
/////////////////////////////////////////////////////////////////////////////////////////////
        account.setPassword(password); //编码阶段，完成后改为account.setPassword(EncryptByMD5.encrypt(password));
/////////////////////////////////////////////////////////////////////////////////////////////
        account.setRole(role);
        if (isUsernaem) {
            account.setUsername(username);
        }
        if (isPhone) {
            account.setPhone(username);
        }
        if (isEmail) {
            account.setEmail(username);
        }
        //查询登陆的用户
        Account login = accountService.login(account);
        if (login == null) {//用户为空，登陆失败
            result = ReturnCode.PASSWORD_ERROR;//返回json是101对应是失败
        } else {//登陆成功
            //用户登陆成功
            if (login.getRole()  == Account.ACCOUNT_ROLE) {
                //存入session中
                session.setAttribute(sessionName, login);
                if (!ip.equals("")&&!city.equals("")) {
                    //添加登陆日志
                    addLoginLog(ip, city, login);
                }
                //添加到cookie中
                addRufullCookie(response, login);
                result = ReturnCode.LOGIN_SUCCESS;//返回json是100对应是成功
            }
/******************************************************************************************/
            //商家已经登陆成功逻辑
            if(login.getRole()  == Account.BUSINESS_ROLE){
                System.out.println("商家成功登陆。。。。");
                session.setAttribute("registerBusiness", login);
                result = login.getStatus()+"";             //商家状态。
            }
/******************************************************************************************/
        }
        //返回页面对应的信息
        returnMessage(response, result);
    }
    /**
     * 检查登陆日志，判断是否异地登陆
     * @param ip
     * @param city
     * @param username
     * @param role
     * @return boolean
     */
    private boolean checkLoglog(String ip, String city, String username,int role) {
        boolean isUsername = RegEx.regExUsername(username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        Account account = null;
        if (isUsername) {
            account = accountService.findAccountByUsername(username, role);
        } else if (isPhone) {
            account = accountService.findAccountByPhone(username, role);
        } else if (isEmail) {
            account = accountService.findAccountByEmail(username, role);
        } else {
            return false;
        }
        //查询登陆日志
        List<LoginLog> logList = loginLogService.fingLoginLogList(account.getId());
        //若为0，代表第一次登陆
        if (logList.size() == 0) {
            return true;
        } else {
            //不为空，则是登陆过了，遍历登陆日志
            for (LoginLog log : logList) {
                if (log.getIp().equalsIgnoreCase(ip) || log.getLocation().equals(city)) {
                    return true;
                }
            }
        }
        return false;
    }
    /**
     * 注册功能
     * @param phoneOrEmail  注册方式，手机或邮箱
     * @param password      注册的密码
     * @param checkCode     验证码
     * @param httpSession   HttpSession
     * @param role          注册的角色
     * @return              返回的视图
     */
    public String register(String phoneOrEmail,
                           String password,
                           String checkCode,
                           HttpSession httpSession,
                           int role){
        Account account = new Account();
        //获取session中的验证码
        String registerCode = (String) httpSession.getAttribute(Account.CHECKCODE_SESSION);
        //判断是否是手机
        boolean isPhone = RegEx.regExPhone(phoneOrEmail);
        //判断是否是邮箱
        boolean isEmail = RegEx.regExEmail(phoneOrEmail);
        if (registerCode == null) {
            //没有获取验证码
            return "index";
        }
        //判断用户输入的验证码是否正确
        if (!registerCode.equals(checkCode)) {
            //验证码错误，回到注册页面
            return "index";
        }
        //设置角色
        account.setRole(role);
/////////////////////////////////////////////////////////////////////////////////////////////
        account.setPassword(password); //编码阶段，完成后改为account.setPassword(EncryptByMD5.encrypt(password));
/////////////////////////////////////////////////////////////////////////////////////////////
        //注册方式是手机
        if (isPhone) {
            //根据手机查找用户账号
            Account user = accountService.findAccountByPhone(phoneOrEmail,role);
            //账号不存在，可以注册
            if (user == null) {
                //设置账号的手机
                account.setPhone(phoneOrEmail);
                accountService.register(account);
                if (role == Account.ACCOUNT_ROLE) {
                    Account registerSuccess =accountService.findAccountByPhone(phoneOrEmail, role);
                    System.out.println(registerSuccess.toString());
                    httpSession.setAttribute(Account.ACCOUNT_SESSION, account);
                    return "index";
                }
/******************************************************************************************/
                //如果是商家注册，跳转到对应页面
                if (role == Account.BUSINESS_ROLE) {
                    Account registerBusiness = accountService.findAccountByPhone(phoneOrEmail, Account.BUSINESS_ROLE);
                    httpSession.setAttribute("registerBusiness",registerBusiness);
                    return "forward:/business/addBusinessUI";
                }
/******************************************************************************************/
            } else {
                //手机被注册了，跳转到注册页面
                return "index";
            }
        }
        //注册方式是邮箱
        if (isEmail) {
            //根据邮箱查找用户账号
            Account user = accountService.findAccountByEmail(phoneOrEmail,role);
            //用户账号不存在,可以注册
            if (user == null) {
                //设置账号的邮箱
                account.setEmail(phoneOrEmail);
                //发送激活账号邮箱
//                Email.sendBing(mailSender, mailMessage, phoneOrEmail);
                //注册账号
                accountService.register(account);
                if (role == Account.ACCOUNT_ROLE) {
                    Account registerSuccess =accountService.findAccountByEmail(phoneOrEmail, role);
                    System.out.println(registerSuccess.toString());
                    httpSession.setAttribute(Account.ACCOUNT_SESSION, registerSuccess);
                    return "index";
                }
/******************************************************************************************/
                //如果是商家注册，跳转到对应页面
                if (role == Account.BUSINESS_ROLE) {
                    Account registerBusiness = accountService.findAccountByEmail(phoneOrEmail, Account.BUSINESS_ROLE);
                    httpSession.setAttribute("registerBusiness",registerBusiness);
                    return "forward:/business/addBusinessUI";
                }
/******************************************************************************************/
            } else {
                //邮箱被注册了，跳转到注册页面
                return "index";
            }
        }
        return "index";
    }
    /**
     * 返回页面的json信息
     * @param response HttpServletResponse
     * @param result   返回json的结果
     */
    public void returnMessage(HttpServletResponse response, String result) {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 将用户的信息存入cookie中
     *
     * @param response HttpServletResponse
     * @param account  用户对象
     */
    public void addRufullCookie(HttpServletResponse response, Account account) {
        //创建gson对象
        Gson gson = new Gson();
        //将account解析为json，存入cookie中
        String cookieValue = gson.toJson(account);
        //添加到cookie中
        RufullCookie.addCookie(response, cookieValue);
    }
    /**
     * 添加登陆的日志
     * @param ip    用户登陆的ip
     * @param location  用户或商家登陆的位置，具体是xx省xx市
     * @param account   用户，主要是获取用户的id
     */
    public void addLoginLog(String ip,String location,Account account){
        loginLogService.addLoginLog(new LoginLog(null, ip, location, new Date(), account.getId()));
    }
}
