package com.cat.rufull.domain.common.util;

import com.cat.rufull.domain.model.Manager;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by Luckily on 2017/12/7.
 */
public class ManagerUtils {

    public static Manager uploadManager(MultipartFile file,
                                   Manager manager,
                                   HttpServletRequest request){
        //上传文件：
        String uploadPath = request.getServletContext().getRealPath("/img/manager");
        String fileName = UUID.randomUUID()+file.getOriginalFilename();

        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),new File(uploadPath,fileName));
            System.out.print("上传路径是："+uploadPath);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("添加图片出错。。。");
        }

        manager.setPhoto(fileName);
        return manager;
    }
}

