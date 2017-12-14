package com.cat.rufull.app.controller.favor;

import com.cat.rufull.domain.model.Favor;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.favor.FavorService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("favor")
public class FavorController {
    @Autowired
    private FavorService favorService;
    @Autowired
    private ShopService shopService;
    @ResponseBody
    @RequestMapping("addFavorShop")
    public String addFavorShop(Favor favor){

        return "添加收藏成功";
    }

    @RequestMapping("/myFavor")
    public ModelAndView findFavorByAccountId(@RequestParam("id") int id) {
        List<Favor> favors = favorService.findShopByAccountId(id);
        List<Shop> shops = new ArrayList<>();
        for (Favor favor : favors) {
            shops.add(shopService.findById(favor.getShopId()));
        }
        ModelAndView view = new ModelAndView();
        view.addObject("favorList", shops);
        view.setViewName("account/favor");
        return view;
    }

    @RequestMapping("/deleteFavor")
    public ModelAndView deleteFavor(@RequestParam("accountId") int accountId, @RequestParam("shopId") int shopId) {
        System.out.println(accountId+"—|—"+shopId);
        favorService.deleteShopByAccountIdAndShopId(accountId, shopId);
        List<Favor> favors = favorService.findShopByAccountId(accountId);
        List<Shop> shops = new ArrayList<>();
        for (Favor favor : favors) {
            shops.add(shopService.findById(favor.getShopId()));
        }
        ModelAndView view = new ModelAndView();
        view.addObject("favorList", shops);
        view.setViewName("account/favor");
        return view;
    }
}
