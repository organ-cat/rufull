package com.cat.rufull.app.account;

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
        String str = "0123456789";
        Random random = new Random();
        String arr[] = new String[4];
        String checkCode = "";
        for (int i = 0; i < 4; i++) {
            int n = random.nextInt(10);
            arr[i] = str.substring(n, n + 1);
            checkCode += arr[i];
        }
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
