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
        //获取cookie
        Cookie[] cookies = request.getCookies();
        if (null == cookies) {
            System.out.println("没有cookie=========");
        } else {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(RufullCookie.RUFULLCOOKIE)) {
                    System.out.println("name:" + cookie.getName() + ",value:" + cookie.getValue());
                    Gson gson = new Gson();
                    Account account = gson.fromJson(cookie.getValue(), Account.class);
                    Account login = accountService.login(account);
                    if (login != null) {
                        System.out.println("1111111111111111111111");
                        session.setAttribute(Account.ACCOUNT_SESSION, login);
                    } else {
                        System.out.println("0000000000000000000000");
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
