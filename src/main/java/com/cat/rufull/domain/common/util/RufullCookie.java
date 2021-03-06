package com.cat.rufull.domain.common.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class RufullCookie {
    public static final String RUFULLCOOKIE = "rufullCookie";   //rufull网站的cookie

    /**
     * 添加cookie
     * @param response
     * @param cookieValue
     */
    public static void addCookie(HttpServletResponse response, String cookieValue) {
        try {
            String accountJSON = URLEncoder.encode(cookieValue, "utf-8");
            //创建一个cookie对象
            Cookie cookie = new Cookie(RUFULLCOOKIE, accountJSON);
            //设置cookie的生命周期，设置为一星期（60 * 60 * 24 * 7 = 604800）
            cookie.setMaxAge(604800);
            //设置cookie存储的路径
            cookie.setPath("/");
            //添加cookie
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}

