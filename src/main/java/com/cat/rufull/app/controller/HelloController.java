package com.cat.rufull.app.controller;

import com.cat.rufull.domain.common.util.RufullCookie;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HelloController {
    private static Logger logger = LoggerFactory.getLogger(HelloController.class);
    private MessageSource messageSource;

    @Autowired
    private AccountService accountService;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, HttpSession session) {
        logger.info(messageSource.getMessage("name", new Object[]{}, null));
        //获取用户的cookie
        Cookie[] cookies = request.getCookies();
        if (null != cookies){
            for (Cookie cookie : cookies) {
                //判断是否存在rufullCookie，即本网站的cookie
                if (cookie.getName().equalsIgnoreCase(RufullCookie.RUFULLCOOKIE)) {
                    Gson gson = new Gson();
                    //将cookie的值转化为Account对象
                    Account account = gson.fromJson(cookie.getValue(), Account.class);
                    //登陆
                    Account login = accountService.login(account);
                    if (login != null) {
                        //登陆成功，将对象存入session
                        session.setAttribute(Account.ACCOUNT_SESSION, login);
                    }
                }
            }
        }

        return "index";
    }
    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
}
