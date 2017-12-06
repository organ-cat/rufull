package com.cat.rufull.domain.common.util;

import com.cat.rufull.domain.model.Product;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class ProductUtils {
    public static Product upload2Product(MultipartFile file,
                                   Product product,
                                   HttpServletRequest request){
        //上传文件：
        String uploadPath = request.getServletContext().getRealPath("/upload/product");
        String fileName = UUID.randomUUID()+file.getOriginalFilename();

        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(uploadPath,fileName));
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("添加商品上传文件出错。。。");
        }

        product.setPhoto(fileName);
        return product;
    }
}
