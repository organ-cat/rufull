package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.LoginLog;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.LoginLogService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private LoginLogService loginLogService;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private SimpleMailMessage mailMessage;

    //跳转到用户注册页面
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "account/loginOrRegister";
    }
    //用户登陆页面
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "account/loginOrRegister";
    }
    //登陆成功页面
    @RequestMapping("/loginSuccess")
    public String loginSuccess(){
        return "account/loginSuccess";
    }

    @RequestMapping("/setUsername")
    public String setUsername(@RequestParam("username") String username, HttpSession session) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setUsername(username);
        accountService.setUsername(account);
        return "account/loginSuccess";
    }

    @RequestMapping("/bindPhone")
    public String bindPhone(@RequestParam("phone") String phone, HttpSession session){
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setPhone(phone);
        accountService.bindPhone(account);
        return "account/loginSuccess";
    }

    @RequestMapping("/bindEmail")
    public String bindEmail(@RequestParam("email") String email, HttpSession session){
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setEmail(email);
        accountService.bindEmail(account);
        return "account/loginSuccess";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

    /**
     * 用户上传头像
     * @param photo
     * @param nickname
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadPhoto")
    public String uploadPhoto(@RequestParam("photo") MultipartFile photo,
                              @RequestParam("nickname") String nickname,
                              HttpServletRequest request) {

        String path = request.getServletContext().getRealPath("upload/account");
        Account account = (Account) request.getSession().getAttribute("account");
        String fileName = "A" + account.getId() + photo.getOriginalFilename();
        System.out.println("头像名字："+fileName);
        if (!fileName.equalsIgnoreCase("A" + account.getId())) {
            account.setPhoto(fileName);
            try {
                FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        account.setNickname(nickname);
        accountService.updateAccountPhoto(account);
        return "account/loginSuccess";
    }
    /**
     * 用户注册
     * @param phoneOrEmail
     * @param password
     * @param checkCode
     * @param httpSession
     * @return
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
     * @param phoneOrEmail
     * @param password
     * @param checkCode
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/businessRegister", method = RequestMethod.POST)
    public String businessRegister(@RequestParam("phone") String phoneOrEmail,
                                   @RequestParam("password") String password,
                                   @RequestParam("checkCode") String checkCode,
                                   HttpSession httpSession) {
        return register(phoneOrEmail, password, checkCode, httpSession, Account.BUSINESS_ROLE);
    }

    /**
     * 用户登陆
     * @param username
     * @param password
     * @param session
     * @param response
     */
    @RequestMapping(value = "/accountLogin", method = RequestMethod.POST)
    public void accountLogin(
                                @RequestParam("username") String username,
                                @RequestParam("password") String password,
                                @RequestParam("ip") String ip,
                                @RequestParam("city") String city,
                                HttpSession session,
                                HttpServletResponse response) {
        System.out.println(ip + city);
        boolean isRemote = checkLoglog(ip, city,username,Account.ACCOUNT_ROLE);
        if (isRemote) {
            this.login(username, password, Account.ACCOUNT_ROLE, session, response, Account.ACCOUNT_SESSION);
        } else {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            try {
                response.getWriter().write("0");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

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
        Account account = accountService.findAccountByEmail(username, role);
        List<LoginLog> logList = loginLogService.fingLoginLogList(account.getId());
        for (LoginLog log : logList) {
            if (log.getIp().equalsIgnoreCase(ip) || log.getLocation().equalsIgnoreCase(city)) {
                return true;
            }
        }

        return false;
    }


    /**
     * 商家登陆
     * @param username
     * @param password
     * @param session
     * @param response
     */
    @RequestMapping(value = "/businessLogin", method = RequestMethod.POST)
    public void businessLogin(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              HttpSession session,
                              HttpServletResponse response) {
        this.login(username, password, Account.BUSINESS_ROLE, session, response, Account.BUSINESS_SESSION);
    }

    /**
     * 登陆功能
     * @param username
     * @param password
     * @param role
     * @param session
     * @param response
     * @param sessionName
     */
    public void login(String username,
                       String password,
                       int role,
                       HttpSession session,
                       HttpServletResponse response,
                       String sessionName){
        Account account = new Account();
        //判断是否是用户名
        boolean isUsernaem = RegEx.regExUsername(username);
        //判断是否是手机
        boolean isPhone = RegEx.regExPhone(username);
        //判断是否是邮箱
        boolean isEmail = RegEx.regExEmail(username);
        //返回结果
        String result = null;
        account.setPassword(password); //编码阶段
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
            result = "0";//返回json是0对应是失败
        } else {//登陆成功
            session.setAttribute(sessionName, login);//存入session中
            result = "1";//返回json是1对应是成功
            //商家已经注册成功逻辑
            if(login.getRole()  == Account.BUSINESS_ROLE){
                result =  String.valueOf(login.getStatus());
            }
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 注册功能
     * @param phoneOrEmail
     * @param password
     * @param checkCode
     * @param httpSession
     * @param role
     * @return
     */
    public String register(String phoneOrEmail,
                           String password,
                           String checkCode,
                           HttpSession httpSession,
                           int role){

        //获取session中的验证码
        String registerCode = (String) httpSession.getAttribute("checkCode");
        //判断是否是手机
        boolean isPhone = RegEx.regExPhone(phoneOrEmail);
        //判断是否是邮箱
        boolean isEmail = RegEx.regExEmail(phoneOrEmail);

        Account account = new Account();

        if (registerCode == null) {
            //没有获取验证码
            return "account/loginOrRegister";
        }
        //判断用户输入的验证码是否正确
        if (!registerCode.equalsIgnoreCase(checkCode)) {
            //验证码错误，回到注册页面
            return "account/loginOrRegister";
        }
        // 编码期间，不加密
        account.setPassword(password);
        //注册方式是手机
        if (isPhone) {
            //根据手机查找用户账号
            Account user = accountService.findAccountByPhone(phoneOrEmail,role);
            //账号不存在，可以注册
            if (user == null) {
                //设置账号的手机
                account.setPhone(phoneOrEmail);
                accountService.register(account);
                if (role == 1) {
                    httpSession.setAttribute(Account.ACCOUNT_SESSION, account);
                    return "account/registerSuccess";
                } else {
                    return "account/registerSuccess";
                }
            } else {
                //手机被注册了，跳转到注册也秒
                return "account/loginOrRegister";
            }
        }
        //注册方式是邮箱
        if (isEmail) {
            //根据邮箱查找用户账号
            Account user = accountService.findAccountByEmail(phoneOrEmail,Account.ACCOUNT_ROLE);
            //用户账号不存在,可以注册
            if (user == null) {
                //设置账号的邮箱
                account.setEmail(phoneOrEmail);
                //发送激活账号邮箱
                Email.sendBing(mailSender, mailMessage, phoneOrEmail);
                //注册账号
                accountService.register(account);
                if (role == 1) {
                    httpSession.setAttribute(Account.ACCOUNT_SESSION, account);
                    return "account/registerSuccess";
                } else {
                    return "account/registerSuccess";
                }
            } else {
                //邮箱被注册了，跳转到注册也秒
                return "account/loginOrRegister";
            }
        }
        return "account/loginOrRegister";
    }

}
