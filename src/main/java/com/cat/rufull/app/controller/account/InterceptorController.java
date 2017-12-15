package com.cat.rufull.app.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class InterceptorController {
    //拦截后，返回的页面
    @RequestMapping("/nologin")
    public String nologin(){
        return "interceptor/nologin";
    }
    @RequestMapping("/admin")
    public String admin(){
        return "system/managerlogin";
    }
}
