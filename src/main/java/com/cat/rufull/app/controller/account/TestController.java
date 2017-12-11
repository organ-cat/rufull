package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.account.AccountService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(HttpSession session, @RequestParam("test") String test) {
        session.setAttribute("account", test);
        System.out.println(test + test);
        return "account/test";
    }

    @RequestMapping(value="/ajax")
    public void testAjax(WebRequest webRequest, HttpServletResponse response, @RequestParam("username") String username){
        List<String> existUsername = Arrays.asList("AAA", "BBB", "CCC");
        System.out.println("测试测试测试"+username);
        String result = null;
        if (existUsername.contains(username)) {
            result = "<font color=\"red\">用户名已经被使用了</font>";
        } else {
            result = "<font color=\"green\">用户名可以使用</font>";
        }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/checkcode")
    public String checkcode( HttpSession httpSession) {
        String code = "aaaaaaaaaaaaaaaaaaaaaaaa";
        httpSession.setAttribute("code", code);
        httpSession.removeAttribute("");
        return "account/test";
    }

    @RequestMapping(value = "/upload")
    public String upload(@RequestParam("photo") MultipartFile photo,
                         HttpServletRequest request,
                         HttpSession session) throws IOException {
        String path = request.getServletContext().getRealPath("upload/account");
        Account account = new Account();
        account.setId(1);
        String fileName = "A" +account.getId()+ photo.getOriginalFilename();
        account.setPhoto(fileName);
        FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path, fileName));
//        accountService.updateAccountPhoto(account);
        session.setAttribute("account",account);
        return "account/loginSuccess";
    }

    @RequestMapping("/cookie")
    public String testCookie(HttpServletResponse response) {
        Cookie cookie = new Cookie("rufullCookie", "I fuck you !");
        cookie.setMaxAge(60);// 设置为30min
        cookie.setPath("/");
        System.out.println("已添加===============");
        response.addCookie(cookie);
        return "account/test";

    }

    @RequestMapping("/code")
    public String code(HttpServletResponse response) {
        
        return "account/test";

    }


}
