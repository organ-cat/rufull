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

    /**
     * 展示管理日志
     * @param model
     * @return
     */
    @RequestMapping("/showManagelog")
    public String showManagelog(Model model) {
        List<ManageLog> list = this.managerLogService.findManageLog();
        model.addAttribute("list", list);
        return "system/managelog/checklog";
    }

    /**
     * 展示用户日志
     * @param model
     * @return
     */
    @RequestMapping("/showAccountlog")
    public String showAccountlog(Model model) {
        List<ManageLog> list = this.managerLogService.findAccountLog();
        model.addAttribute("list", list);
        return "system/managelog/checklog";
    }

    /**
     * 跳转到查询页面
     * @return
     */
    @RequestMapping("goLogs")
    public String goLogs() {
        return "system/managelog/checklog";
    }

    /**
     * 根据条件查询
     * @param beginTime
     * @param endTime
     * @param keyword
     * @param model
     * @return
     */
    @RequestMapping("/checkLogs")
    public String checkLogs(Date beginTime,Date endTime,String keyword, Model model){
        List<ManageLog> manageLogs = managerLogService.findLogsByCondition(beginTime,endTime,keyword);
        model.addAttribute("Logslist", manageLogs);
        return "system/managelog/checklog";
    }
}
