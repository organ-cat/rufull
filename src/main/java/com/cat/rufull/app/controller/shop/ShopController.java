package com.cat.rufull.app.controller.shop;

import com.cat.rufull.domain.common.util.ShopUtils;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("shop")
public class ShopController {
    @Autowired
    private ShopService shopService;

    //去到添加商店页面，在这里应该有一个BusinessId的值，但是还没有加上去
    @RequestMapping("addShopUI")
    public String addShopUI(){
        return "shop/shopSettle";
    }
    //添加商店在shopSettle.jsp中应该要直接获取BusinessId的值，但是在页面中还没有写。
    @RequestMapping("addShop")
    public String addShop(@RequestParam(value = "file")MultipartFile file,
                          Shop shop, String[] shippingTimePart,
                          HttpServletRequest request){

        ShopUtils.upload2Shop(file,shop,shippingTimePart,request);
//        shopService.add(shop);
        return "test";
    }


    //用户查看商店页面
    @RequestMapping(value = "showShopDetail",method = RequestMethod.GET)
    public String showShopDetail(Integer id, ModelMap map){

        //缺少获取展示所有商家页面，点击商家页面后跳过过来这里。
        Shop shopDetail = shopService.findById(id);
        System.out.println("shopDetail"+shopDetail);

        map.put("shop",shopDetail);
        return "shop/accountToShop";
    }

    //用户查看商家资质
    @RequestMapping(value = "showBusinessLicense",method = RequestMethod.GET)
    public String showBusinessLicense(Integer id,ModelMap map){
        //查找对应的商店
        Shop shopDetail = shopService.findById(id);
        map.put("shop",shopDetail);

        return "shop/accountToBusinessLicense";
    }

    //查看商家评价：小伟要自己写
    @RequestMapping(value = "showShopComments",method = RequestMethod.GET)
    public String showBusinnessLicence(Integer id,ModelMap map){
        //查找对应的商店
        Shop shopDetail = shopService.findById(id);

        map.put("shop",shopDetail);
        return "shop/accountToShopComments";
    }


    //查找正常营业的商家和休息的商家：
    @RequestMapping("showAllShop")
    public String showAllShow(ModelMap map){
        List<Shop> shopList = shopService.findAll();
        map.put("shopList",shopList);
        return "shop/showAllShop";
    }
}
