package com.cat.rufull.app.controller.business;


import com.cat.rufull.domain.common.util.BusinessUtils;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("business")
public class BusinessController {
    @Autowired
    private BusinessService businessService;

    @Autowired
    private ShopService shopService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    /**
     *@Author:Caoxin
     *@Description
     *@Date:11:48 2017/12/7
     *@param[files, business, request]
     * file:用户上传的图片信息
     *@returnjava.lang.String
     */
    @RequestMapping("addBusiness")
    public String addBusiness(@RequestParam(value = "files")MultipartFile[] files,
                             Business business,
                             HttpServletRequest request,
                              Integer accountId)throws Exception {
        //上传文件并添加用户
         Business finishedBusiness = BusinessUtils.upload2Business(files, business, request,accountId);
         System.out.println("finished:"+finishedBusiness);
         businessService.add(finishedBusiness);

        //将商家对应状态改为：已经填写入驻信息，但是未通过管理员审核200
        accountService.updateAccountStatus(finishedBusiness.getAccount().getId(),
                                                Business.BUSINESS_STATUS_SETTLED);
        return "business/waitForReview";                   //从定向到一个信息提示页面：等待页面管理员审核
                                                            //提示完成后等待几秒钟跳转会用户界面。
    }

   /**
   *@Author:Caoxin
   *@Description：展示商家页面
   *@Date:11:15 2017/12/13
   *@param
   *@return
   */
    @RequestMapping("showBusinessProfile")
    public String showBusiness(HttpServletRequest request){
        HttpSession session = request.getSession();

        Account businnessAccount = (Account) session.getAttribute(Account.BUSINESS_SESSION);  //从Session中获得商家登录的用户
        Business business= businessService.findBusinessByAccountId(businnessAccount.getId()); //通过用户查询商家
        System.out.println("business:"+business);
        Shop shop = shopService.findShopByBusinessId(business.getId());                                   //通过商家查询商店
        System.out.println("shop:"+shop);
        if(shop != null){
            session.setAttribute("shop",shop);
        }

       return "business/businessProfile";
    }

    //5.审核没有通过，管理员可以通过给用户短信告诉用户未通过信息。
    // 当用户登录以后，信息回显到bussinessSettleUpdate.jsp
    @RequestMapping("reFillSettle")
    public String reFillSettle(){
        return "";
    }


    /**
    *@Author:Caoxin
    *@Description:查询不同订单的状态，返回不同的订单列表
    *@Date:11:19 2017/12/13
    *@param shopId：商家id orderStatus:需要订单状态
    *@return
    */
    @RequestMapping(value = "showOrder",method = RequestMethod.GET)
    public String showOrder(@RequestParam(value = "shopId",required = false) Integer shopId,
                           @RequestParam(value = "orderStatus",required = false) String orderStatus,
                           Model model){
//        System.out.println("shopId:"+shopId);
//        System.out.println("orderStatus:"+orderStatus);

        if(shopId != null && orderStatus != null){
            List<Order> suitableOrderList = orderService.findShopOrdersByStatus(shopId,orderStatus);
            System.out.println("suitableOrderList:"+suitableOrderList);
            model.addAttribute("orderList",suitableOrderList);
        }
        return "business/"+BusinessUtils.orderUrlMap.get(orderStatus);
    }


   /**
   *@Author:Caoxin
   *@Description:跳转到商家个人信息页面：businessInfo.jsp
   *@Date:11:12 2017/12/13
   *@param
   *@return
   */
    @RequestMapping("showAccountAndShopInfo")
    public String showAccountAndShopInfo(HttpSession session){

        Shop shop = (Shop) session.getAttribute("shop");
        session.setAttribute("shop",shopService.findById(shop.getId()));
        return "business/businessInfo";
    }

    /**
    *@Author:Caoxin
    *@Description:跳转到商家入驻信息页面：businessSettleInfo.jsp
    *@Date:11:13 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("showBusinessSettleInfo")
    public String showBusinessSettleInfo(){
        return "business/businessSettleInfo";
    }

    /**
    *@Author:Caoxin
    *@Description：跳转到密码重置页面：businessResetPassword.jsp
    *@Date:11:13 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("resetPassword")
    public String resetPassword(){
        return "business/businessResetPassword";
    }

    /**
    *@Author:Caoxin
    *@Description：跳转到加入商家页面：joinBusiness.jsp
    *@Date:11:14 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("joinBusiness")
    public String joinBusiness(){
        return "business/joinBusiness";
    }

    /**
    *@Author:Caoxin
    *@Description：跳转到停业整顿页面：beRectified.jsp
    *@Date:11:14 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("beRectified")
    public String beRectified(){
        return "business/beRectified";
    }

   /**
   *@Author:Caoxin
   *@Description:跳转到等待审核页面：waitForReview.jsp
   *@Date:11:15 2017/12/13
   *@param
   *@return
   */
    @RequestMapping("waitForReview")
    public String waitForReview(){
        return "business/waitForReview";
    }

    /**
    *@Author:Caoxin
    *@Description跳转到加入商家：businessSettle.jsp
    *@Date:11:18 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("addBusinessUI")
    public String addBusinessUI(){
        return "business/businessSettle";
    }


    @RequestMapping("reSettleBusiness")
    public String reSettleBusiness(){
        return "business/reSettle";
    }



}
