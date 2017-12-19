package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.Page;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.codehaus.jackson.map.ObjectMapper;
import org.omg.CORBA.MARSHAL;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
     *
     * @param model
     * @return
     */
    @RequestMapping("/showManagelog")
    public String showManagelog(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<ManageLog> list = this.managerLogService.findManageLog();
        int total = (int) new PageInfo<>(list).getTotal();
        page.setTotal(total);
        model.addAttribute("loglist", list);
        model.addAttribute("page", page);
        return "system/managelog/checklog";
    }

    /**
     * 展示用户日志
     *
     * @param model
     * @return
     */
    @RequestMapping("/showAccountlog")
    public String showAccountlog(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<ManageLog> list = this.managerLogService.findAccountLog();
        int total = (int) new PageInfo<>(list).getTotal();
        page.setTotal(total);
        model.addAttribute("Accloglist", list);
        model.addAttribute("page", page);
        return "system/managelog/checkAcclog";
    }

    /**
     * 跳转到查询页面
     *
     * @return
     */
    @RequestMapping("goLogs")
    public String goLogs(Model model, Page page) {
        page.setTotal(0);
        model.addAttribute("page", page);
        return "system/managelog/findlog";
    }

    /**
     * 根据条件查询
     *
     * @param beginTime
     * @param endTime
     * @param keyword
     * @param model
     * @return
     */
    @RequestMapping("/checkLogs")
    public String checkLogs(String beginTime, String endTime, String keyword, Model model,
                            HttpServletRequest request, Page page)
            throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date begin = null;
        Date end = null;
        if (beginTime != null && beginTime != "") {
            begin = formatter.parse(beginTime);
        }
        if (endTime != null && endTime != "") {
            end = formatter.parse(endTime);
        }
        if (begin != null && end != null && begin.getTime() > end.getTime()) {
            request.setAttribute("timeerror", "时间错误");
            return "system/managelog/findlog";
        }

        List<ManageLog> manageLogs = managerLogService.findLogsByCondition(begin, end, "%" + keyword + "%");
        PageHelper.offsetPage(page.getStart(), page.getCount());
        model.addAttribute("Logslist", manageLogs);
        model.addAttribute("page", page);
        return "system/managelog/findlog";
    }

}
