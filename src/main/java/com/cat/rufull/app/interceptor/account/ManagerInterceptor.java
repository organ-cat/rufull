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
        Manager manger = (Manager) request.getSession().getAttribute("manger");
        manger.getRole();
        //判断管理员是否登陆
        if (manger == null) {
            //未登陆，请求转发到指定页面
            request.getRequestDispatcher("/error/error").forward(request, response);
            //不放行
            return false;
        } else {
            //已经登陆
            //判断管理员的角色
            if (!manger.getRole().equals(2)) {
                request.getRequestDispatcher("/error/error").forward(request, response);
            }
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
