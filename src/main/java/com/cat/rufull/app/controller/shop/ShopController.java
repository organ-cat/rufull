package com.cat.rufull.app.controller.shop;

import com.cat.rufull.domain.common.util.ShopUtils;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("shop")
public class ShopController {
    @Autowired
    private ShopService shopService;

    /**
    *@Author:Caoxin
    *@Description:去到添加商店页面，在这里应该有一个BusinessId的值，但是还没有加上去
    *@Date:11:32 2017/12/13
    *@param
    *@return
    */
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
        shopService.add(shop);
        return "business/businessProfile";
    }


    /**
    *@Author:Caoxin
    *@Description：用户查看商店页面
    *@Date:11:28 2017/12/13
    *@param
    *@return
    */
    @RequestMapping(value = "showShopDetail",method = RequestMethod.GET)
    public String showShopDetail(Integer id, ModelMap map){

        //缺少获取展示所有商家页面，点击商家页面后跳过过来这里。
        Shop shopDetail = shopService.findById(id);
        System.out.println("shopDetail"+shopDetail);

        map.put("shop",shopDetail);
        return "shop/accountToShop";
    }

    /**
    *@Author:Caoxin
    *@Description：用户查看商家资质
    *@Date:11:28 2017/12/13
    *@param
    *@return
    */
    @RequestMapping(value = "showBusinessLicense",method = RequestMethod.GET)
    public String showBusinessLicense(Integer id,ModelMap map){

        Shop shopDetail = shopService.findById(id); //查找对应的商店
        map.put("shop",shopDetail);

        return "shop/accountToBusinessLicense";
    }

    /**
    *@Author:Caoxin
    *@Description：查看商家评价：小伟要自己写
    *@Date:11:28 2017/12/13
    *@param
    *@return
    */
    @RequestMapping(value = "showShopComments",method = RequestMethod.GET)
    public String showBusinnessLicence(Integer id,ModelMap map){
        //查找对应的商店
        Shop shopDetail = shopService.findById(id);

        map.put("shop",shopDetail);
        return "shop/accountToShopComments";
    }

    /**
    *@Author:Caoxin
    *@Description： 查找正常营业的商家和休息的商家
    *@Date:11:27 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("showAllShop")
    public String showAllShow(ModelMap map){
        List<Shop> shopList = shopService.findAll();
        map.put("shopList",shopList);
        return "shop/showAllShop";
    }

    /**
    *@Author:Caoxin
    *@Description：通过id查询商店的商品
    *@Date:23:48 2017/12/13
    *@param：shopId商店
    *@return
    */
    @RequestMapping("findProductListById")
    @ResponseBody
    public List<Product> findProductListById(Integer shopId){
        return shopService.findById(shopId).getProductList();
    }


    /**
    *@Author:Caoxin
    *@Description:通过输入内容搜索出对应的商家
    *@Date:11:46 2017/12/14
    *@param
    *@return
    */
    @RequestMapping(value = "findFuzzySearchShop")
    @ResponseBody
    public List<Shop> findFuzzySearchShop(String searchContext){
        System.out.println("searchContext:"+searchContext);
        List<Shop> shopList = shopService.fuzzyFindByShopAndProduct(searchContext);
        System.out.println("shopList:"+shopList);
        return shopList;
    }
}
