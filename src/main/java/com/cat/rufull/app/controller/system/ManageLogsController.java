package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import org.codehaus.jackson.map.ObjectMapper;
import org.omg.CORBA.MARSHAL;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/8.
 */
@Controller
@RequestMapping("/manageLog")
public class ManageLogsController {
    @Resource
    private ManagerLogService managerLogService;

    @RequestMapping("/showlog.do")
    public String showlog(Model model) {
        List<ManageLog> list = this.managerLogService.findAllLog();
        model.addAttribute("list", list);
        return "system/managelog/checklog";
    }

    @RequestMapping("/checkLogs")
    public String checkLogs(Date beginTime,Date endTime,String keyword, Model model){
        List<ManageLog> manageLogs = managerLogService.findLogsByCondition(beginTime,endTime,keyword);
        model.addAttribute("Logslist", manageLogs);
        return "system/managelog/checklog";
    }
}
