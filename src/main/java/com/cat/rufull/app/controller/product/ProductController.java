package com.cat.rufull.app.controller.product;

import com.cat.rufull.domain.common.util.PaginationResult;
import com.cat.rufull.domain.common.util.ProductUtils;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.service.product.ProductService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private ShopService shopService;
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
                             HttpServletRequest request,
                             Integer shopId,
                             HttpSession session){
        Product finishedProduct = ProductUtils.upload2Product(file, product, request,shopId);
        productService.add(finishedProduct);


        session.setAttribute("shop",shopService.findById(shopId));
        return "redirect:/business/showBusinessProfile";
    }
    /**
     *@Author:Caoxin
     *@Description
     *@Date:0:58 2017/12/15
     *@param[shopId, id, status, session]
     *@returnjava.lang.String
     */
    @RequestMapping("updateProductStatus/{shopId}/{id}/{status}")
    public String updateProductStatus(@PathVariable("id") Integer shopId,
                                      @PathVariable("id") Integer id,
                                      @PathVariable("status") Integer status,
                                      HttpSession session){

        System.out.println("shopId:"+shopId);
        System.out.println("id:"+id);
        System.out.println("status:"+status);
         ;
        if (status == Product.PRODUCT_NORMAL) {
            productService.updateByIdSelective(new Product(id,Product.PRODUCT_SALEOUT));
        }else{
            productService.updateByIdSelective(new Product(id,Product.PRODUCT_NORMAL));
        }

        session.setAttribute("shop",shopService.findById(shopId));
        return "redirect:/business/showBusinessProfile";
    }
    /**
     *@Author:Caoxin
     *@Description
     *@Date:0:58 2017/12/15
     *@param[shopId, id, status, session]
     *@returnjava.lang.String
     */
    @RequestMapping("deleteProductStatus/{shopId}/{id}/{status}")
    public String deleteProductStatus(@PathVariable("id") Integer shopId,
                                      @PathVariable("id") Integer id,
                                      @PathVariable("status") Integer status,
                                      HttpSession session){
        System.out.println("shopId:"+shopId);
        System.out.println("id:"+id);
        System.out.println("status:"+status);
        ;
        productService.updateByIdSelective(new Product(id,Product.PRODUCT_DELETE));

        session.setAttribute("shop",shopService.findById(shopId));
        return "redirect:/business/showBusinessProfile";
    }

    /**
     *@Author:Caoxin
     *@Description
     *@Date:1:06 2017/12/15
     *@param
     *@returnjava.lang.String
     */
    @RequestMapping("updateProductUI/{id}")
    public String updateProductUI(@PathVariable("id") Integer id,
                                  Model model){
        Product product = productService.findProductById(id);
        model.addAttribute("product",product);
        return "product/updateProductUI";
    }

    /**
     *@Author:Caoxin
     *@Description
     *@Date:14:59 2017/12/17
     *@param[product, shop_Id, request, file, session]
     *@returnjava.lang.String
     */
    @RequestMapping("updateProduct")
    public String updateProduct(Product product,
                                 Integer shop_Id,
                                 HttpServletRequest request,
                                 MultipartFile file,
                                 HttpSession session
                                ){

        System.out.println("product:"+product);
        System.out.println("file"+file);

        productService.updateByIdSelective(ProductUtils.update2Product(file,product,request));


        session.setAttribute("shop",shopService.findById(shop_Id));
        return "redirect:/business/showBusinessProfile";
    }


    @RequestMapping(value = "pageForProduct",method = RequestMethod.GET)
    @ResponseBody
    public PaginationResult pageForProduct(Integer shopId, Integer limit, Integer offset){
        List<Product> products = productService.pageSelectForProduct(shopId, offset, limit);

        PaginationResult paginationResult = new PaginationResult(products.size(),products);
        return paginationResult;
    }

    @RequestMapping("showPageForProduct")
    public String showPageForProduct(){
        return "business/bootstrap_table";
    }

}

