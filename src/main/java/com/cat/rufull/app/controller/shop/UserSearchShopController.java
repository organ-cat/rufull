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
import java.util.Map;

@Controller
@RequestMapping("/")
public class UserSearchShopController {
    @Autowired
    private ShopService shopService;

    /**
    *@Author:Caoxin
    *@Description:用户输入地址后搜索商家
    *@Date:11:24 2017/12/13
    *@param定位的区域是：city,经度是：lng,维度:lat
    *@return
    */
    @RequestMapping(value = "/searchShop",method = RequestMethod.GET)
    private String shopHome(String city, String address, String lng, String lat, Model model, HttpSession session){
//        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
        List<Shop> shopList = shopService.findAll();
        JSONArray jsonShopList = JSONArray.fromObject(shopList);

        Map<Integer, Integer> shopEvaluation = shopService.getShopEvaluation(shopList);//查询所有的商店评分
        JSONArray jsonShopEvaluation = JSONArray.fromObject(shopEvaluation);

        Map<Integer, Integer> shopSalesMap = shopService.getShopSales(shopList);//查询所有商家的销售量
        JSONArray jsonShopSales = JSONArray.fromObject(shopEvaluation);

        model.addAttribute("shopEvaluation",jsonShopEvaluation);
        model.addAttribute("ShopSales",jsonShopSales);
        model.addAttribute("shopList",jsonShopList);

        session.setAttribute("address", address);
        session.setAttribute("lng", lng);
        session.setAttribute("lon", lat);
//        System.out.println("jsonShopList:"+shopList);
        return "shop/showAllShop";
    }

   /**
   *@Author:Caoxin
   *@Description:重新跳转到新的主页
   *@Date:11:25 2017/12/13
   *@param
   *@return
   */
    @RequestMapping(value = "/changeAddressUI",method = RequestMethod.GET)
    private String changeAddress(){
        return "changeaddress";
    }


    /**
    *@Author:Caoxin
    *@Description:用户更换新地址后搜索新的商家
    *@Date:11:26 2017/12/13
    *@param:新的地址是newaddress,定位区域：city，经度lng，维度：lat
    *@return
    */
    @RequestMapping(value = "/newSearchShop",method = RequestMethod.GET)
    public String newAddress(String city,String lng,String lat,String newaddress,HttpSession session,Model model){
//        System.out.println("定位的区域是："+city+"，经纬度是："+lng+","+lat);
//        System.out.println("新的地址是："+newaddress);
        List<Shop> shopList = shopService.findAll();//查询商家
        JSONArray jsonShopList = JSONArray.fromObject(shopList);

        Map<Integer, Integer> shopEvaluation = shopService.getShopEvaluation(shopList);//查询所有的商店评分
        JSONArray jsonShopEvaluation = JSONArray.fromObject(shopEvaluation);

        Map<Integer, Integer> shopSalesMap = shopService.getShopSales(shopList);//查询所有商家的销售量
        JSONArray jsonShopSales = JSONArray.fromObject(shopEvaluation);

        model.addAttribute("shopEvaluation",jsonShopEvaluation);
        model.addAttribute("ShopSales",jsonShopSales);
        model.addAttribute("shopList",jsonShopList);

        session.setAttribute("lng",lng);
        session.setAttribute("lon",lat);
        session.setAttribute("address",newaddress);

        return "shop/showAllShop";
    }
}
