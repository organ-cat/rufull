package com.cat.rufull.app.controller.shop;

import com.cat.rufull.domain.common.util.ShopUtils;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.FootprintService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.shop.ShopService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("shop")
public class ShopController {
    @Autowired
    private ShopService shopService;

    @Autowired
    private BusinessService businessService;

    @Autowired
    private EvaluationService evaluationService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private FootprintService footprintService;
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
                          HttpServletRequest request,
                          HttpSession session){
        Account account = (Account) session.getAttribute(Account.BUSINESS_SESSION);                     //从session中查找商家

        accountService.updateAccountStatus(account.getId(),Business.BUSINESS_STATUS_CREATED_SHOP);   //更新商家用户对应的状态为创建商店

        Business business = businessService.findBusinessByAccountId(account.getId());   //通过查询出account来找到商家id
        ShopUtils.upload2Shop(file,shop,shippingTimePart,request,business);              //创建商店
        shopService.add(shop);

        return "forward:/business/showBusinessProfile";
    }


    /**
    *@Author:Caoxin
    *@Description：用户查看商店页面
    *@Date:11:28 2017/12/13
    *@param
    *@return
    */
    @RequestMapping(value = "showShopDetail",method = RequestMethod.GET)
    public String showShopDetail(Integer id, ModelMap map,HttpSession session) throws Exception {


        Shop shopDetail = shopService.findById(id);//查询出对应的商店
        System.out.println("shopDetail"+shopDetail);

        JSONArray jsonProductList = JSONArray.fromObject(shopDetail.getProductList());

        Map<Integer, Integer> productEvaluationMap =
                shopService.getShopProductEvaluation(shopDetail);//查询出商品评价
        JSONArray jsonproductEvaluationMap = JSONArray.fromObject(productEvaluationMap);

        Double shopEvaluation = evaluationService.findAvarageByShopId(shopDetail.getId());//查找商家评价
        if(shopEvaluation == null){
            shopEvaluation = 0.0;
        }

        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        if(account != null ){
            footprintService.addFootprint(new Footprint(id,account.getId()));//用户不为空的时候，为用户添加足记
        }


        map.put("productEvaluationMap",jsonproductEvaluationMap);
        map.put("shopEvaluation",shopEvaluation.intValue());
        map.put("shop",shopDetail);
        map.put("productList",jsonProductList);
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
    public String showBusinessLicense(Integer id,ModelMap map) throws Exception {

        Shop shopDetail = shopService.findById(id); //查找对应的商店
        Double shopEvaluation = evaluationService.findAvarageByShopId(shopDetail.getId());//查询商店评分

        if(shopEvaluation == null){
            shopEvaluation = 0.0;
        }

        map.put("shopEvaluation",shopEvaluation.intValue());
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
    //查看商家评价：小伟要自己写
    @RequestMapping(value = "showShopComments",method = RequestMethod.GET)
    public String showBusinnessLicence(Integer id, ModelMap map) throws Exception{
        //查找对应的商店
        Shop shopDetail = shopService.findById(id);
        map.put("shop",shopDetail);

        //查询商店的全部评价
        List<OrderEvaluation> orderEvaluations = evaluationService.findEvalByShopId(id);
        map.put("orderEvaluations", orderEvaluations);

        //查询商店满意的评价
        List<OrderEvaluation> orderEvaluations1 = evaluationService.findEvalByShopId_Y(id);
        map.put("orderEvaluations1", orderEvaluations1);

        //查询商店不满意的评价
        List<OrderEvaluation> orderEvaluations2 = evaluationService.findEvalByShopId_N(id);
        map.put("orderEvaluations2", orderEvaluations2);

        Double shopEvaluation = evaluationService.findAvarageByShopId(shopDetail.getId());//查询商店评分

        if(shopEvaluation == null){
            shopEvaluation = 0.0;
        }

        map.put("shopEvaluation",shopEvaluation.intValue());
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
        List<Shop> shopList = shopService.findAll();       //查询所有允许营业的shop


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

    /**
     *@Author:Caoxin
     *@Description:更新商家状态
     *@Date:10:49 2017/12/18
     *@param[id, operateState, session]
     *@returnjava.lang.String
     */
    @RequestMapping(value = "updateShopOperateState/{id}/{operateState}")
    public String updateShopOperateState(@PathVariable("id") Integer id,
                                          @PathVariable("operateState") Integer operateState,
                                         HttpSession session){
        if(operateState == Shop.SHOP_STATUS_NORMAL){
            shopService.updateByIdSelective(new Shop(id,Shop.SHOP_STATUS_REST));
        }else {
            shopService.updateByIdSelective(new Shop(id,Shop.SHOP_STATUS_NORMAL));
        }

        session.setAttribute("shop",shopService.findById(id));
        return "forward:/business/showBusinessProfile";
    }

    /**
     *@Author:Caoxin
     *@Description跳转到更新商家页面
     *@Date:16:08 2017/12/18
     *@param[id, map]
     *@returnjava.lang.String
     */
    @RequestMapping("updateShopUI")
    public String updateShopUI(Integer id,ModelMap map){
        Shop shop = shopService.findById(id);
        System.out.println("shop:"+shop);


        map.addAttribute("shop",shop);
        return "shop/updateShopUI";
    }

    @RequestMapping("updateShop")
    public String updateShop(@RequestParam(value = "file")MultipartFile file,
                             Shop shop, String[] shippingTimePart,
                             Integer businessId,
                             HttpServletRequest request
                           ){
       Business business = new Business();
       business.setId(businessId);

       System.out.println("businessId:"+businessId);
        Shop finishedShop = ShopUtils.upload2Shop(file, shop, shippingTimePart, request, business);//创建商店
       shopService.updateById(finishedShop);

        return "redirect:/business/showAccountAndShopInfo";
    }

}
