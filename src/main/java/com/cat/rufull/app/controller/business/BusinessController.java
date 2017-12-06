package com.cat.rufull.app.controller.business;


import com.cat.rufull.domain.common.util.BusinessUtils;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.service.business.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("business")
public class BusinessController {
    @Autowired
    private BusinessService businessService;

    //跳转添加商家界面
    @RequestMapping("addBusinessUI")
    public String addBusinessUI(){
        return "business/businessSettle";
    }

    //添加商家
    @RequestMapping("addBusiness")
    public String addBusiness(@RequestParam(value = "files")MultipartFile[] files,
                             Business business,
                             HttpServletRequest request)throws Exception {

        //上传文件
         Business finishedBusiness = BusinessUtils.upload2Business(files, business, request);
         System.out.println("finished:"+finishedBusiness);

         //添加商家:看看用户外键有没有添加进来
        //businessService.add(finishedBusiness);
        return "hello";
    }

}
