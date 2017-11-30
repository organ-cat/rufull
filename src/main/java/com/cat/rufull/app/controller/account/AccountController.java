package com.cat.rufull.app.controller.account;

import com.aliyuncs.exceptions.ClientException;
import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthOptionPaneUI;

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

    @RequestMapping("/register")
    public String register(){

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
        Account account = new Account();
        boolean isUsernaem = RegEx.regExUsername(username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        account.setPassword(password);
        if (isUsernaem) {
            account.setUsername(username);
        }
        if (isPhone) {
            account.setPhone(username);
        }
        if (isEmail) {
            account.setEmail(username);
        }
        System.out.println("测试-username:" + account.getUsername());
        System.out.println("测试-phone:" + account.getPhone());
        System.out.println("测试-email:" + account.getEmail());
        Account login = accountService.login(account);
        model.put("account", login);
        return "hello";
    }

}
