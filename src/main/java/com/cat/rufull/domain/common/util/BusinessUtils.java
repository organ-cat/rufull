package com.cat.rufull.domain.common.util;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Business;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class BusinessUtils {
    public static String uploadPath;
    public static Business upload2Business(MultipartFile[] files,
                                           Business business,
                                           HttpServletRequest request,
                                           Integer accountId){
        /*
            文件上传的图片顺序是：
            室外照片，室内照片，身份证正面，身份证反面，商家营业执照，餐厅服务执照，身份证
         */
        uploadPath = request.getServletContext().getRealPath("/upload/business");
        for (int i = 0; i < files.length; i++) {
            String fileName = UUID.randomUUID() + files[i].getOriginalFilename();
            System.out.println("fileName:"+fileName);

            try {
                FileUtils.copyInputStreamToFile(files[i].getInputStream(), new File(uploadPath, fileName));
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("商家上传文件失败。。。");
            }
            if (i == 0){
                business.setFrontPhoto(fileName);
            } else if(i == 1){
                business.setInsidePhoto(fileName);
            } else if (i == 2) {
                business.setIdFrontPhoto(fileName);
            } else if( i == 3){
                business.setIdBackPhoto(fileName);
            }  else if( i == 4){
                business.setBusinessLicence(fileName);
            }  else {
                business.setCateringServiceLicense(fileName);
            }
        }
        //将accountId封装到business中
        Account account = new Account();
        account.setId(accountId);
        business.setAccount(account);
        return business;
    }
}
