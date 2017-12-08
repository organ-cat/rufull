package com.cat.rufull.domain.common.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class RufullCookie {
    public static final String RUFULLCOOKIE = "rufullCookie";

    public static void addCookie(HttpServletResponse response, String cookieValue) {
        Cookie cookie = new Cookie(RUFULLCOOKIE, cookieValue);
        cookie.setMaxAge(30*60);// 设置为30min
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}

