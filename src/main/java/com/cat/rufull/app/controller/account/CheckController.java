package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/check")
public class CheckController {
    @Autowired
    private AccountService accountService;
    public final Integer ACCOUNT_ROLE = 1;//用户角色编号
    public final Integer BUSINESS_ROLE = 2;//商家角色编号

    public void checkUsername(String username, String role) {
        Account account = accountService.findAccountByUsername("jiang", 1);
        System.out.println();
        System.out.println(account.toString());
        System.out.println();
    }


    /**
     * 检验用户注册方式是否被使用
     * @param response
     * @param phone
     */
    @RequestMapping(value="/checkAccountRegisterWays")
    public void checkAccountRegisterWays(HttpServletResponse response, @RequestParam("phone") String phone){
        this.check(phone, ACCOUNT_ROLE, response);
    }

    /**
     * 检验商家注册方式是否被使用
     * @param response
     * @param phone
     */
    @RequestMapping(value="/checkBusinessRegisterWays")
    public void checkBusinessRegisterWays(HttpServletResponse response, @RequestParam("phone") String phone){
        this.check(phone, BUSINESS_ROLE, response);
    }

    /**
     * 发送注册码
     * @param phone
     * @param session
     * @param response
     */
    @RequestMapping(value = "/sendRegisterCode")
    public void sendRegisterCode(@RequestParam("phone") String phone,
                                 HttpSession session,
                                 HttpServletResponse response) {
        String result = null;
        String checkCode = getCode();
        boolean isPhone = RegEx.regExPhone(phone);
        boolean isEmail = RegEx.regExEmail(phone);
        if (isPhone) {
            result = "31";//短信验证码已发送成功,请尽快确认
            //发送短信
            System.out.println("手机" + phone + "收到验证码是：" + checkCode);
        }
        if (isEmail) {
            result = "32";//邮箱验证码已发送成功，请尽快确认
            //发送邮箱
            System.out.println("邮箱" + phone + "收到验证码是：" + checkCode);
        }
        session.setAttribute("checkCode",checkCode);
        returnMessage(response, result);
    }


    /**
     * 用户和商家注册方式的校验
     * @param phone
     * @param role
     * @param response
     */
    public void check(String phone,Integer role,HttpServletResponse response){
        String result = null;
        boolean isPhone = RegEx.regExPhone(phone);
        boolean isEmail = RegEx.regExEmail(phone);
        if (isPhone) {
            Account account = accountService.findAccountByPhone(phone, role);
            if (account == null) {
                result = "10";//手机通过
            } else {
                result = "11";//手机通过
            }
        } else {
            result = "12";//手机格式错误
        }

        if (isEmail) {
            Account account = accountService.findAccountByEmail(phone, role);
            if (account == null) {
                result = "20";//手机通过
            } else {
                result = "21";//手机通过
            }
        } else if (!isEmail && ! isPhone) {
            result = "22";//手机或邮箱格式错误
        }

        returnMessage(response, result);
    }

    @RequestMapping("/sendRometeCheckCode")
    public void sendRometeCheckCode(@RequestParam("username") String username,
                                    HttpSession session,
                                    HttpServletResponse response) {
        System.out.println("接受到的用户名——" + username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        boolean isUsername = RegEx.regExEmail(username);
        Account account = null;
        if (isUsername) {
            account = accountService.findAccountByUsername(username, Account.ACCOUNT_ROLE);
        }
        if (isPhone) {
            account = accountService.findAccountByPhone(username, Account.ACCOUNT_ROLE);
        }
        if (isEmail) {
            account = accountService.findAccountByEmail(username, Account.ACCOUNT_ROLE);
        }
        String phone = account.getPhone();
        String email = account.getEmail();
        String code = getCode();
        String result = null;
        if (phone != null) {
            System.out.println("手机" + phone + "异地登陆的验证码是——" + code);
            result = "1";
        } else {
            System.out.println("邮箱" + email + "异地登陆的验证码是——" + code);
            result = "1";
        }
        session.setAttribute(Account.REMOTE_CODE, code);
        returnMessage(response,result);
    }


    /**
     * 返回页面的json信息
     * @param response
     * @param result
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

    public String getCode(){
        String str = "0123456789";
        Random random = new Random();
        String arr[] = new String[4];
        String checkCode = "";
        for (int i = 0; i < 4; i++) {
            int n = random.nextInt(10);
            arr[i] = str.substring(n, n + 1);
            checkCode += arr[i];
        }
        return checkCode;
    }
}
