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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

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

    private int checkCode;

    public int getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(int checkCode) {
        this.checkCode = checkCode;
    }

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "account/register";
    }

    @RequestMapping("/registerBusinessPage")
    public String registerBusinessPage() {
        return "account/registerBusiness";
    }

    @RequestMapping("/registerBusiness")
    public String registerBusiness(WebRequest request,
                           @RequestParam("phone")String phoneOrEmail,
                           @RequestParam("password")String password) {
        System.out.println("接受参数——"+phoneOrEmail+"——"+password);
        boolean isPhone = RegEx.regExPhone(phoneOrEmail);
        boolean isEmail = RegEx.regExEmail(phoneOrEmail);
        Account account = new Account();
        account.setPassword(password);
        account.setStatus(200);

        account.setRegisterTime(new Date());
        if (isPhone) {
            Account user = accountService.findAccountByPhone(phoneOrEmail);
            if (user == null) {
                account.setPhone(phoneOrEmail);
                accountService.register(account);
                System.out.println("注册成功isPhone");
            }else {
                System.out.println("失败失败isPhone");
                return "account/registerBusiness";
            }
        }
        if (isEmail) {
            Account user = accountService.findAccountByEmail(phoneOrEmail);
            if (user == null) {
                account.setEmail(phoneOrEmail);
                Email.sendBing(mailSender,mailMessage,phoneOrEmail);
                accountService.register(account);
                System.out.println("注册成功isEmail");
            }else {
                System.out.println("失败失败isEmail");
                return "account/registerBusiness";
            }
        }
        return "hello";
    }

    @RequestMapping("/register")
    public String register(WebRequest request,
                           @RequestParam("phone")String phoneOrEmail,
                           @RequestParam("password")String password) {
        System.out.println("接受参数——"+phoneOrEmail+"——"+password);
        boolean isPhone = RegEx.regExPhone(phoneOrEmail);
        boolean isEmail = RegEx.regExEmail(phoneOrEmail);
        Account account = new Account();
        account.setPassword(password);
        account.setRegisterTime(new Date());
        if (isPhone) {
            Account user = accountService.findAccountByPhone(phoneOrEmail);
            if (user == null) {
                account.setPhone(phoneOrEmail);
                accountService.register(account);
                System.out.println("注册成功isPhone");
            }else {
                System.out.println("失败失败isPhone");
                return "account/register";
            }
        }
        if (isEmail) {
            Account user = accountService.findAccountByEmail(phoneOrEmail);
            if (user == null) {
                account.setEmail(phoneOrEmail);
                Email.sendBing(mailSender,mailMessage,phoneOrEmail);
                accountService.register(account);
                System.out.println("注册成功isEmail");
            }else {
                System.out.println("失败失败isEmail");
                return "account/register";
            }
        }
        return "hello";
    }

    @RequestMapping("/loginPage")
    public String loginPage(){
        return "account/login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request,ModelMap model){
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("username---"+username);
        System.out.println("password---"+password);

        Account account = new Account();
        boolean isUsernaem = RegEx.regExUsername(username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        account.setPassword(password);
        if (isUsernaem) {
            System.out.println("isUsernaem-"+username);
            account.setUsername(username);
        }
        if (isPhone) {
            System.out.println("isPhone-"+username);
            account.setPhone(username);
        }
        if (isEmail) {
            System.out.println("isEmail-"+username);
            account.setEmail(username);
        }
        Account login = accountService.login(account);
        if (login == null) {
            return "account/loginPage";
        } else {
            model.put("account", login);
            return "hello";
        }
    }
//    @RequestMapping(value="/jiang")
//    public @ResponseBody void sendCheckCode(HttpSession httpSession){
//        Account account = new Account();
//        account.setUsername("HttpSession");
//        httpSession.setAttribute("jiang", account);
//        System.out.println("------------------------------");
//    }
    @RequestMapping(value="/test")
    public String test(HttpSession httpSession){
        return "account/test";
    }


}
