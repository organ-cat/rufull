package com.cat.rufull.app.controller.product;

import com.cat.rufull.domain.common.util.ProductUtils;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    /**
    *@Author:Caoxin
    *@Description:跳转到添加商品界面
    *@Date:11:33 2017/12/13
    *@param
    *@return
    */
    @RequestMapping("addProductUI")
    public String addProductUI(){
        return "product/addProductUI";
    }

    /**
    *@Author:Caoxin
    *@Description添加商品
    *@Date:11:33 2017/12/13
    *@param product,file,request
    *@return
    */
    @RequestMapping("addProduct")
    public String addProduct(Product product,
                             @RequestParam(value = "file")MultipartFile file,
                             HttpServletRequest request){
        Product finishedProduct = ProductUtils.upload2Product(file, product, request);
        System.out.println("finished:"+finishedProduct);
        productService.add(finishedProduct);
        return "business/businessProfile";
    }
}

