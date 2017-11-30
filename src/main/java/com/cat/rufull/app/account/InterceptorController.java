package com.cat.rufull.app.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/interceptor")
public class InterceptorController {
    @RequestMapping("/nologin")
    public String nologin(){
        return "interceptor/nologin";
    }
}
