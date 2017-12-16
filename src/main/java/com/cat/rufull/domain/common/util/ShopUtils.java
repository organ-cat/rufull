package com.cat.rufull.domain.common.util;

import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Shop;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class ShopUtils {

        public static Shop upload2Shop(MultipartFile file,
                                       Shop shop,
                                       String[] shippingTimePart,
                                       HttpServletRequest request,
                                       Business business){
            //上传文件：
            String uploadPath = request.getServletContext().getRealPath("/upload/shop");
            String fileName = UUID.randomUUID()+file.getOriginalFilename();

            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(),new File(uploadPath,fileName));
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("添加商店上传文件出错。。。");
            }

            shop.setShopPhoto(fileName);
            shop.setBusiness(business);
            shop.setOperateTime(shippingTimePart[0]+"-"+shippingTimePart[1]+","+shippingTimePart[2]+"-"+shippingTimePart[3]);
            return shop;
        }
}
