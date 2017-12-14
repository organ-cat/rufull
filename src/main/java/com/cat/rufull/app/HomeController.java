package com.cat.rufull.app;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Luckily on 2017/12/5.
 */
@Controller
@RequestMapping("/user")
public class HomeController {
    @Resource
    private ShopService service;

    @RequestMapping("/shopHome.do")
    private String shopHome(String city, String address, String lng, String lat, Model model, HttpSession session){
        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
        model.addAttribute("address", address);
        Account user = new Account();
        user.setId(2012002);
        user.setNickname("我是小钟");
        session.setAttribute("user",user);
        return "home";
    }

    @RequestMapping("/changeAddress.do")
    private String changeAddress(){
        return "changeaddress";
    }

    @RequestMapping("/newAddress.do")
    public String newAddress(String city,String lng,String lat,String newaddress,Model model){
        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
        System.out.println("新的地址是："+newaddress);
        model.addAttribute("address",newaddress);
        return "home";
    }
}
