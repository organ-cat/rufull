package com.cat.rufull.app.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/address")
public class AddressController {
    @RequestMapping("/address")
    public String registerPage() {
        return "account/login/address";
    }

}
