package com.cat.rufull.app.controller.system;

import com.aliyuncs.http.HttpRequest;
import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.EncryptByMD5;
import com.cat.rufull.domain.common.util.ManagerUtils;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.system.ManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/5.
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

    @Resource
    private ManageService manageService;
    @Resource
    private ManagerLogService logService;

    private ManageLog log;

    private Date date = new Date();

    /**
     * 跳转管理员登录界面
     * @return
     */
    @RequestMapping("adminlogin")
    public String adminlogin() {
        return "system/managelogin";
    }

    /**
     * 管理员登录
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public String login(@RequestParam("username") String username ,
                        @RequestParam("password") String password,
                        HttpServletRequest request, HttpSession session) {
        Manager manager = new Manager();
        boolean isUsername = RegEx.regExUsername(username);
        boolean isPhone = RegEx.regExPhone(username);
        boolean isEmail = RegEx.regExEmail(username);
        manager.setPassword(password);
        if (isUsername) {
            manager.setUsername(username);
        }
        if (isPhone) {
            manager.setPhone(username);
        }
        if (isEmail) {
            manager.setEmail(username);
        }
        Manager mlogin = manageService.login(manager);
        session.setAttribute("manager", mlogin);
        return "system/systemindex";
    }

    /**
     * 管理员退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("manager");
        return "system/managelogin";
    }


    /**
     * 跳转到管理员添加页面
     * @param session
     * @return
     */
    @RequestMapping("/addManager")
    public String saveManager(HttpSession session) {
        session.removeAttribute("adderror");
        return "system/manager/addmanager";
    }

    /**
     * 获取所有管理员
     * @param model
     * @return
     */
    @RequestMapping("/getManagerList")
    public String getManagerList(Model model){
        List<Manager> mlist = manageService.findAll();
        model.addAttribute("allmlist", mlist);
        return "system/manager/managerlist";
    }

    /**
     * 保存管理员
     * @param file
     * @param manager
     * @param model
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/saveManager")
    public String saveManager(@RequestParam(value = "file")MultipartFile file,
                              Manager manager, Model model, HttpSession session,
                              HttpServletRequest request)  {
        session.removeAttribute("logerror");
        session.removeAttribute("addMerror");
        session.removeAttribute("addMsuccess");
        Manager mana = (Manager) session.getAttribute("manager");
        Manager newManager = ManagerUtils.uploadManager(file,manager,request);
            int i = manageService.saveManager(newManager);
            if (i >= 1) {
                session.setAttribute("addMsuccess","成功了！");
                log.setCreateTime(DateFormat.getNewdate(date));
                log.setDetail("添加新的管理员！");
                log.setManager(mana);
                log.setType(1);
                int a = logService.addLog(log);
                if (a >= 1) {
                    return "redirect:getManagerList";
                } else
                    session.setAttribute("logerror","添加日志失败!");
                    return "redirect:getManagerList";
            } else
                session.setAttribute("addMerror","失败了！");
            model.addAttribute("managers", manager);
            return "system/manager/addmanager";
        }


    /**
     * 获取管理员详细信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getManager/{id}")
    public String getManager(@PathVariable Integer id, Model model) {
        Manager manager = manageService.getManagerById(id);
        model.addAttribute("manager", manager);
        return "system/manager/updatemanager";
    }

    /**
     * 更新管理员
     * @param manager
     * @param model
     * @param session
     * @param attr
     * @return
     */
    @RequestMapping("/updateManager")
    public String updateManager(Manager manager, Model model,
                                HttpSession session, RedirectAttributes attr) throws Exception{
            session.removeAttribute("updateerror");
            session.removeAttribute("updatesuccess");
            session.removeAttribute("logerror");
            Manager mana = (Manager) session.getAttribute("manager");
            Manager old = manageService.getManagerById(manager.getId());
            old.setEmail(manager.getEmail());
            old.setPhone(manager.getPhone());
            old.setUsername(manager.getUsername());
            old.setPassword(EncryptByMD5.encrypt(manager.getPassword()));

            int i = manageService.updateManager(old);
            if (i >= 1) {
                session.setAttribute("updatesuccess","成功了！");
                log.setCreateTime(DateFormat.getNewdate(date));
                log.setDetail("修改管理员信息！");
                log.setManager(mana);
                log.setType(1);
                int a = logService.addLog(log);
                if (a >= 1) {
                    return "redirect:getManagerList";
                } else
                    model.addAttribute("managers", manager);
                    return "redirect:getManagerList";
            } else
                session.setAttribute("updateerror","出错了!");
            Integer id = manager.getId();
            attr.addAttribute("id", id);
            return "redirect : getManager";
        }


    /**
     * 删除管理员
     * @param id
     * @param session
     * @param attr
     * @return
     */
    @RequestMapping("/delManager/{id}")
    public String delManager(@PathVariable Integer id,
                             HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("delerror");
        session.removeAttribute("delsuccess");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        int i = manageService.delManager(id);
        if (i >= 1) {
            session.setAttribute("delsuccess","成功");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除管理员！");
            log.setType(1);
            log.setManager(mana);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getManagerList";
            } else
                session.setAttribute("logerror","日志写入错误");
                return "redirect:getManagerList";
        } else
            session.setAttribute("delerror","失败");
                return "redirect:getManagerList";
    }


    /**
     * 根据字段查询管理员
     * @param findname
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/find")
    public String find(@RequestParam("findname") String findname, Model model, HttpSession session){
        session.removeAttribute("logerror");
        List<Manager> findlist = manageService.findName(findname);
        model.addAttribute("findmlist", findlist);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("查询管理员！");
        log.setManager((Manager) session.getAttribute("manager"));
        log.setType(1);
        int a = logService.addLog(log);
        if (a >= 1) {
            return "system/manager/findlist";
        } else
            session.setAttribute("logerror","出错了");
        return "system/manager/findlist";
    }

}
