package com.cat.rufull.app.interceptor.account;

import com.cat.rufull.domain.model.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取session中管理员对象
        Manager manger = (Manager) request.getSession().getAttribute("manager");
        //判断管理员是否登陆
        if (manger == null) {
            //未登陆，请求转发到指定页面
            System.out.println("管理员未登录");
            response.getWriter().write("<script type='text/javascript'>alert('管理员未登录！')</script>");
            response.setHeader("Refresh", "0.2;url=/rufull/adminLogin/admin");
            //不放行
            return false;
        } else {
            //已经登陆
            //判断管理员的角色
            System.out.println("放行");
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }
}
