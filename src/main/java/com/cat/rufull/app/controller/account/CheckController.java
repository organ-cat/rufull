package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.common.util.Email;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.common.util.ReturnCode;
import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;
    /**
     * 第一次绑定手机或者邮箱接受的验证码
     * @param phone     用户输入的手机或者邮箱
     * @param session
     * @param response
     */
    @RequestMapping("/sendCode")
    public void sendCode(@RequestParam("phone") String phone,HttpSession session,HttpServletResponse response){
        boolean isPhone = RegEx.regExPhone(phone);
        boolean isEmail = RegEx.regExEmail(phone);
        String code =  getCode();
        if (isPhone) {
            session.setAttribute(Account.FORGOT_PASSWORD,code);
            System.out.println("手机接收——"+phone+"——验证码——"+code);
            SMS.sendSMS(phone,code);
        } else if (isEmail) {
            session.setAttribute(Account.FORGOT_PASSWORD,code);
            System.out.println("邮箱接收——"+phone+"——验证码——"+code);
            Email.sendBing(mailSender, mailMessage, phone, code);
        } else {
            returnMessage(response, ReturnCode.PHONE_FORMAT_ERROR);
        }
    }

    /**
     * 第一次绑定手机或邮箱，对其进行校验
     * @param phone         用户输入的手机或者邮箱
     * @param response
     */
    @RequestMapping("/checkPhoneOrEmail")
    public void checkPhoneOrEmail(@RequestParam("phone") String phone, HttpServletResponse response) {
        String result = null;
        boolean isPhone = RegEx.regExPhone(phone);
        boolean isEmail = RegEx.regExEmail(phone);
        if (isPhone) {
            result = ReturnCode.PHONE_PASSED;
        } else if (isEmail) {
            result = ReturnCode.EMAIL_PASSED;
        } else {
            result = ReturnCode.PHONE_FORMAT_ERROR;
        }
        returnMessage(response, result);
    }

    /**
     * 用户设置用户名，可以用于登陆
     * @param username      用户输入的用户名
     * @param response
     */
    @RequestMapping("/checkUsername")
    public void checkUsername(@RequestParam("username") String username, HttpServletResponse response) {
        Account account = accountService.findAccountByUsername(username, Account.ACCOUNT_ROLE);
        if (account == null) {
            returnMessage(response, "1");
        } else {
            returnMessage(response, "0");
        }
    }

    /**
     * 校验手机
     * @param phone     用户输入的手机
     * @param response
     */
    @RequestMapping(value = "/checkPhone")
    public void checkPhone(@RequestParam("phone") String phone,
                              HttpServletResponse response) {
        boolean isPhone = RegEx.regExPhone(phone);
        if (isPhone) {
            Account account = accountService.findAccountByPhone(phone, Account.ACCOUNT_ROLE);
            if (account == null) {
                returnMessage(response, ReturnCode.PHONE_PASSED);
            } else {
                returnMessage(response, ReturnCode.PHONE_REGISTERED);
            }
        } else {
            returnMessage(response, ReturnCode.PHONE_FORMAT_ERROR);
        }

    }

    /**
     * 校验邮箱
     * @param email     用户输入的邮箱
     * @param response
     */
    @RequestMapping(value = "/checkEmail")
    public void checkEmail(@RequestParam("email") String email,
                           HttpServletResponse response) {
        boolean isEmail = RegEx.regExEmail(email);
        if (isEmail) {
            Account account = accountService.findAccountByEmail(email, Account.ACCOUNT_ROLE);
            if (account == null) {
                returnMessage(response, ReturnCode.EMAIL_PASSED);
            } else {
                returnMessage(response, ReturnCode.EMAIL_REGISTERED);
            }
        } else {
            returnMessage(response, ReturnCode.EMAIL_FORMAT_ERROR);
        }
    }

    /**
     * 发送旧手机验证码
     * @param phone     用户输入的旧手机
     * @param session
     */
    @RequestMapping(value = "/sendbindPhone")
    public void sendbindPhone(@RequestParam("phone") String phone,
                              HttpSession session) {
        String checkCode = getCode();
        session.setAttribute(Account.PHONE_CHECK_CODE, checkCode);
        System.out.println("绑定手机" + phone + "收到验证码是：" + checkCode);
        SMS.sendSMS(phone,checkCode);
    }
    /**
     * 发送新手机验证码
     * @param phone     用户输入的新手机
     * @param session
     */
    @RequestMapping(value = "/sendbindNewPhone")
    public void sendbindNewPhone(@RequestParam("phone") String phone,
                              HttpSession session) {
        String checkCode = getCode();
        session.setAttribute(Account.NEW_PHONE_CHECK_CODE, checkCode);
        System.out.println("绑定-新-手机" + phone + "收到验证码是：" + checkCode);
        SMS.sendSMS(phone,checkCode);
    }
    /**
     * 发送旧邮箱验证码
     * @param email     用户输入的旧邮箱
     * @param session
     */
    @RequestMapping(value = "/sendbindEmail")
    public void sendbindEmail(@RequestParam("email") String email,
                              HttpSession session) {
        String checkCode = getCode();
        session.setAttribute(Account.EMAIL_CHECK_CODE, checkCode);
        System.out.println("绑定邮箱" + email + "收到验证码是：" + checkCode);
        Email.sendBing(mailSender, mailMessage, email, checkCode);
    }
    /**
     * 发送旧邮箱验证码
     * @param email     用户输入的旧邮箱
     * @param session
     */
    @RequestMapping(value = "/sendbindNewEmail")
    public void sendbindNewEmail(@RequestParam("email") String email,
                                 HttpSession session) {
        String checkCode = getCode();
        session.setAttribute(Account.NEW_EMAIL_CHECK_CODE, checkCode);
        System.out.println("绑定-新-邮箱" + email + "收到验证码是：" + checkCode);
        Email.sendBing(mailSender, mailMessage, email, checkCode);
    }
    /**
     * 检验用户注册方式是否被使用
     * @param response      HttpServletResponse
     * @param phone         用户注册方式，手机/邮箱
     */
    @RequestMapping(value="/checkAccountRegisterWays")
    public void checkAccountRegisterWays(HttpServletResponse response, @RequestParam("phone") String phone){
        this.check(phone, Account.ACCOUNT_ROLE, response);
    }
    /**
     * 检验商家注册方式是否被使用
     * @param response  HttpServletResponse
     * @param phone     商家注册方式，手机/邮箱
     */
    @RequestMapping(value="/checkBusinessRegisterWays")
    public void checkBusinessRegisterWays(HttpServletResponse response, @RequestParam("phone") String phone){
        this.check(phone, Account.BUSINESS_ROLE, response);
    }
    /**
     * 发送注册码
     * @param phone     注册的手机，但是可以是邮箱，发送注册码则会是邮箱注册码
     * @param session   HttpSession
     * @param response  HttpServletResponse
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
            result = ReturnCode.SNED_PHONE_CODE;//短信验证码已发送成功,请尽快确认
            //发送短信
            System.out.println("手机" + phone + "收到验证码是：" + checkCode);
            SMS.sendSMS(phone,checkCode);
        }
        if (isEmail) {
            result = ReturnCode.SNED_EMAIL_CODE;//邮箱验证码已发送成功，请尽快确认
            //发送邮箱
            System.out.println("邮箱" + phone + "收到验证码是：" + checkCode);
            Email.sendBing(mailSender, mailMessage, phone, checkCode);
        }
        session.setAttribute(Account.CHECKCODE_SESSION,checkCode);
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
                result = ReturnCode.PHONE_PASSED;//手机通过
            } else {
                result = ReturnCode.PHONE_REGISTERED;//手机号码被注册了
            }
        } else {
            result = ReturnCode.PHONE_FORMAT_ERROR;//手机格式错误
        }
        if (isEmail) {
            Account account = accountService.findAccountByEmail(phone, role);
            if (account == null) {
                result = ReturnCode.EMAIL_PASSED;//邮箱通过
            } else {
                result = ReturnCode.EMAIL_REGISTERED;//手机通过
            }
        } else if (!isEmail && ! isPhone) {
            result = ReturnCode.EMAIL_FORMAT_ERROR;//手机或邮箱格式错误
        }
        returnMessage(response, result);
    }
    /**
     * 发送异地登陆的验证码
     * @param username  用户的用户名，可以是用户名/手机/邮箱
     * @param session   HttpSession
     * @param response  HttpServletResponse
     */
    @RequestMapping("/sendRometeCheckCode")
    public void sendRometeCheckCode(@RequestParam("username") String username,
                                    HttpSession session,
                                    HttpServletResponse response) {
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        boolean isUsername = RegEx.regExUsername(username);
        Account account = null;
        if (isUsername) {
            account = accountService.findAccountByUsername(username, Account.ACCOUNT_ROLE);
        }else if (isPhone) {
            account = accountService.findAccountByPhone(username, Account.ACCOUNT_ROLE);
        }else if (isEmail) {
            account = accountService.findAccountByEmail(username, Account.ACCOUNT_ROLE);
        }
        String phone = account.getPhone();
        String email = account.getEmail();
        String code = getCode();
        String result = null;
        if (phone != null) {
            System.out.println("手机" + phone + "异地登陆的验证码是——" + code);
            SMS.sendSMS(phone,code);
            result = ReturnCode.SNED_REMOTE_CODE_SUCCESS;
        } else {
            System.out.println("邮箱" + email + "异地登陆的验证码是——" + code);
            Email.sendBing(mailSender, mailMessage, phone, code);
            result = ReturnCode.SNED_REMOTE_CODE_SUCCESS;
        }
        session.setAttribute(Account.REMOTE_CODE_SESSION, code);
        returnMessage(response,result);
    }
    /**
     * 返回页面的json信息
     * @param response
     * @param result 返回页面的json信息
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
     * 获取随机验证码
     * @return 四位数的验证码
     */
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
