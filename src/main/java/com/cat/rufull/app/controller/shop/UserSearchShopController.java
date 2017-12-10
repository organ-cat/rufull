package com.cat.rufull.app.controller.shop;

import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.shop.ShopService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserSearchShopController {
    @Autowired
    private ShopService shopService;

    //用户输入地址后搜索商家
    @RequestMapping(value = "/searchShop",method = RequestMethod.GET)
    private String shopHome(String city, String address, String lng, String lat, Model model, HttpSession session){
//        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
        List<Shop> shopList = shopService.findAll();
        JSONArray jsonShopList = JSONArray.fromObject(shopList);

        model.addAttribute("shopList",jsonShopList);
        model.addAttribute("address", address);
        model.addAttribute("lng",lng);
        model.addAttribute("lon",lat);
//        System.out.println("jsonShopList:"+shopList);

        return "shop/showAllShop";
    }

    //重新跳转到新的主页
    @RequestMapping(value = "/changeAddressUI",method = RequestMethod.GET)
    private String changeAddress(){
        return "changeaddress";
    }


    //用户更换新地址后搜索新的商家
    @RequestMapping(value = "/newSearchShop",method = RequestMethod.GET)
    public String newAddress(String city,String lng,String lat,String newaddress,Model model){
//        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
//        System.out.println("新的地址是："+newaddress);
        List<Shop> shopList = shopService.findAll();
        JSONArray jsonShopList = JSONArray.fromObject(shopList);

        model.addAttribute("shopList",jsonShopList);
        model.addAttribute("lng",lng);
        model.addAttribute("lon",lat);
        model.addAttribute("address",newaddress);

        return "shop/showAllShop";
    }
}
