package com.cat.rufull.app.interceptor.account;

import com.cat.rufull.domain.model.Account;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断用户是否登陆
        if (request.getSession().getAttribute(Account.ACCOUNT_SESSION) == null) {
            //未登陆，请求转发到指定页面
            request.getRequestDispatcher("/error/nologin").forward(request, response);
            //不放行
            return false;
        } else {
            //已经登陆，放行
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
