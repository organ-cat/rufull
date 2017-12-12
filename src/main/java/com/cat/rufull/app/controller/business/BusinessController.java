package com.cat.rufull.app.controller.business;


import com.cat.rufull.domain.common.util.BusinessUtils;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("business")
public class BusinessController {
    @Autowired
    private BusinessService businessService;

    @Autowired
    private ShopService shopService;

    @Autowired
    private AccountService accountService;

    //1.跳转添加商家界面
    @RequestMapping("addBusinessUI")
    public String addBusinessUI(){

        return "business/businessSettle";
    }

    //2.添加商家
    @RequestMapping("addBusiness")
    public String addBusiness(@RequestParam(value = "files")MultipartFile[] files,
                             Business business,
                             HttpServletRequest request,
                              Integer accountId)throws Exception {
        /**
        *@Author:Caoxin
        *@Description
        *@Date:11:48 2017/12/7
        *@param[files, business, request]
         * file:用户上传的图片信息
        *@returnjava.lang.String
        */
        //上传文件添加用户
         Business finishedBusiness = BusinessUtils.upload2Business(files, business, request,accountId);
         System.out.println("finished:"+finishedBusiness);
        businessService.add(finishedBusiness);

        //将商家对应状态改为：已经填写入驻信息，但是未通过管理员审核200
        Account account = accountService.findAccountById(finishedBusiness.getAccount().getId());
        account.setStatus(Business.BUSINESS_STATUS_SETTLED);
//      accountService.updateAccount(account);
        return "business/waitForReview";                   //从定向到一个信息提示页面：等待页面管理员审核
                                                //提示完成后等待几秒钟跳转会用户界面。
    }

    //3.展示对应的商家主页-------从用户登陆的js中跳转过来
    @RequestMapping("showBusinessProfile")
    public String showBusiness(HttpServletRequest request, ModelMap map){
//        HttpSession session = request.getSession();
//        Account businnessAccount = session.getAttribute(Account.BUSINESS_SESSION);  //从Session中获得商家登录的用户
//
//        Business business= businessService.findBusinessByAccountId(businnessAccount.getId());
//
//        map.put("business",business);
//
//        //页面还没有写
        Business business = businessService.findById(1);
        Shop shop = shopService.findById(1);
        map.put("business",business);
        map.put("shop",shop);


//        System.out.println("business:"+business);
//        System.out.println("shop;"+shop);
       return "business/businessProfile";
    }

    //4.显示等待审核页面
    @RequestMapping("waitForReview")
    public String waitForReview(){
        return "business/waitForReview";
    }

    //5.审核没有通过，管理员可以通过给用户短信告诉用户未通过信息。
    // 当用户登录以后，信息回显到bussinessSettleUpdate.jsp
    @RequestMapping("reFillSettle")
    public String reFillSettle(){
        return "";
    }

    @RequestMapping("joinBusiness")
    public String joinBusiness(){
        return "business/joinBusiness";
    }

    @RequestMapping("beRectified")
    public String beRectified(){
        return "business/beRectified";
    }


}
