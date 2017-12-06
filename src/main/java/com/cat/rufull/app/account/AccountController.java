package com.cat.rufull.app.account;

import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@SessionAttributes({"account"})
@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private SimpleMailMessage mailMessage;

    public final Integer ACCOUNT_ROLE = 1;//用户角色编号
    public final Integer BUSINESS_ROLE = 2;//商家角色编号
    public final String ACCOUNT_SESSION = "account";
    public final String BUSINESS_SESSION = "business";

    @RequestMapping("/registerPage")
    public String registerPage() {
        //跳转到用户注册页面
        return "account/loginOrRegister";
    }
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "account/loginOrRegister";
    }

    /**
     * 用户注册
     * @param phoneOrEmail
     * @param password
     * @param checkCode
     * @param httpSession
     * @return
     */
    @RequestMapping("/accountRegister")
    public String accountRegister(@RequestParam("phone") String phoneOrEmail,
                           @RequestParam("password") String password,
                           @RequestParam("checkCode") String checkCode,
                           HttpSession httpSession) {
        return register(phoneOrEmail, password, checkCode, httpSession, ACCOUNT_ROLE);
    }

    /**
     * 商家注册
     * @param phoneOrEmail
     * @param password
     * @param checkCode
     * @param httpSession
     * @return
     */
    @RequestMapping("/businessRegister")
    public String businessRegister(@RequestParam("phone") String phoneOrEmail,
                                  @RequestParam("password") String password,
                                  @RequestParam("checkCode") String checkCode,
                                  HttpSession httpSession) {
        return register(phoneOrEmail, password, checkCode, httpSession, BUSINESS_ROLE);
    }

    @RequestMapping("/loginSuccess")
    public String loginSuccess(){
        return "hello";
    }

    @RequestMapping("/accountLogin")
    public void accountLogin(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        ModelMap model,
                        HttpServletResponse response){
        System.out.println("用户注册："+username+"-"+password);
        this.login(username, password, ACCOUNT_ROLE, model, response, ACCOUNT_SESSION);
    }
    @RequestMapping("/businessLogin")
    public void businessLogin(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        ModelMap model,
                        HttpServletResponse response){
        System.out.println("商家注册："+username+"-"+password);
        this.login(username, password, BUSINESS_ROLE, model, response, BUSINESS_SESSION);
    }

    /**
     * 登陆功能
     * @param username
     * @param password
     * @param role
     * @param model
     * @param response
     * @param sessionName
     */
    public void login(String username,
                       String password,
                       Integer role,
                       ModelMap model,
                       HttpServletResponse response,
                       String sessionName){
        Account account = new Account();
        boolean isUsernaem = RegEx.regExUsername(username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
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
        Account login = accountService.login(account);
        if (login == null) {
            System.out.println("登陆——失败");
            result = "0";
        } else {
            model.put(sessionName, login);
            result = "1";
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
     * 注册的方法
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
                           Integer role){
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
        //设置账号密码,通过MD5加密
        //account.setPassword(EncryptByMD5.encrypt(password));
        // 编码期间，不加密
        account.setPassword(password);
        //注册方式是手机
        if (isPhone) {
            //根据手机查找用户账号
            Account user = accountService.findAccountByPhone(phoneOrEmail,ACCOUNT_ROLE);
            //账号不存在，可以注册
            if (user == null) {
                //设置账号的手机
                account.setPhone(phoneOrEmail);
                accountService.register(account);
                return "account/registerSuccess";
            } else {
                //账号存在，返回注册页面
                return "account/loginOrRegister";
            }
        }
        //注册方式是邮箱
        if (isEmail) {
            //根据邮箱查找用户账号
            Account user = accountService.findAccountByEmail(phoneOrEmail,ACCOUNT_ROLE);
            //用户账号不存在,可以注册
            if (user == null) {
                //设置账号的邮箱
                account.setEmail(phoneOrEmail);
                //发送激活账号邮箱
                Email.sendBing(mailSender, mailMessage, phoneOrEmail);
                accountService.register(account);
                return "account/registerSuccess";
            } else {
                return "account/loginOrRegister";
            }
        }
        return "account/loginOrRegister";
    }

}
