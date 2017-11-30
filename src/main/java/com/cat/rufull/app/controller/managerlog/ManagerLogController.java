package com.cat.rufull.app.controller.managerlog;

import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
@Controller
@RequestMapping("managerlog")
public class ManagerLogController {
    @Resource
    private ManagerLogService service;

    @RequestMapping("/showlog.do")
    public String showlog(Model model){
        List<ManageLog> list = this.service.findAllLog();
        model.addAttribute("list",list);
        System.out.println(list.size()+"   ssdfsdfdsaf");
        return "managelog/checklog";
    }

}
