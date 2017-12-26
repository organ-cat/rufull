package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.EncryptByMD5;
import com.cat.rufull.domain.common.util.ManagerUtils;
import com.cat.rufull.domain.common.util.Page;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.system.ManageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/5.
 */
@Controller
@RequestMapping("/manager")
public class ManageController {

    @Resource
    private ManageService manageService;
    @Resource
    private ManagerLogService logService;

    private ManageLog log = new ManageLog();

    private Date date = new Date();


    /**
     * 管理员退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("manager");
        return "system/managerlogin";
    }

    /**
     * 获得欢迎页面
     *
     * @return
     */
    @RequestMapping("/getwelcome")
    public String getwelcome() {
        return "system/system_welcome";
    }


    /**
     * 获得自己的个人信息
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getManagerInfo")
    public String getManagerInfo(Model model, HttpSession session) {
        List<Manager> list = new ArrayList<Manager>();
        Manager manager = (Manager) session.getAttribute("manager");
        list.add(manager);
        model.addAttribute("managerInfo", list);
        return "system/manager/managerinfo";
    }

    /**
     * 跳转到密码修改界面
     *
     * @return
     */
    @RequestMapping("/changePwd")
    public String changePwd() {
        return "system/manager/changePwd";
    }


    /**
     * ajax验证原密码
     *
     * @param password
     * @param response
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/checkPwd")
    public String checkPwd(String password, HttpServletResponse response,
                           HttpSession session) throws Exception {
        Integer flag = 1;
        try {
            Manager manager = (Manager) session.getAttribute("manager");
            //if(EncryptByMD5.encrypt(password).equals(manager.getPassword().toString()))
            System.out.println(password+"------------------------"+manager.getPassword().toString());
            if (EncryptByMD5.encrypt(password).equals(manager.getPassword().toString())) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().print(flag);
            } else {
                flag = 0;
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().print(flag);
            }
        } catch (Exception e) {
            flag = 0;
        }
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(flag);

        return null;
    }


    /**
     * 确定修改密码
     *
     * @param pwd1
     * @param session
     * @return
     */
    @RequestMapping("/editPwd")
    public String editPwd(String password, String pwd1, HttpSession session,
                          RedirectAttributes attr, HttpServletRequest request) {
        Manager manager = (Manager) session.getAttribute("manager");
        if (!EncryptByMD5.encrypt(password).equals(manager.getPassword())) {
            attr.addFlashAttribute("repetpwd", "重复密码不一致");
            return "redirect:changePwd";
        }

        manager.setPassword(EncryptByMD5.encrypt(pwd1));
        int i = manageService.updateManager(manager);
        if (i >= 1) {
            session.setAttribute("manager",manager);
            attr.addFlashAttribute("editpwdsuccess", "更新成功");
            return "redirect:getManagerInfo";

        } else {

            attr.addFlashAttribute("editpwderror", "更新失败");
            return "redirect:changePwd";
        }
    }


    @RequestMapping("/resetPhoto")

    public String resetPhoto(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request, HttpSession session,
                             HttpServletResponse response) throws Exception {
        String picpath = null;
        String path = null;
        Manager manager = (Manager) session.getAttribute("manager");
        try {
            Manager newManager = ManagerUtils.uploadManager(file, manager, request);
            manageService.updateManager(newManager);
            picpath = "upload/manager/" + newManager.getPhoto().toString();
            path = "{\"path\":\"" + picpath + "\",\"relativePath\":\"upload/manager/profile-pic.jpg\"}";
            session.setAttribute("manager",newManager);
            System.out.print("成功上传路径名：" + path);
        } catch (Exception e) {
            picpath = "upload/manager/profile-pic.jpg";
            path = "{\"path\":\"" + picpath + "\",\"relativePath\":\""+picpath+"\"}";
            System.out.print("失败上传路径名：" + path);
        }
        response.setContentType("text/html;charset=UTF-8");
        Manager newmana = manageService.getManagerById(manager.getId());
        session.setAttribute("manager",newmana);
        response.getWriter().print(path);
        return null;

    }

    /**
     * 自己修改个人信息
     *
     * @param manager
     * @param session
     * @return
     */

    @RequestMapping("/editManagerInfo")
    public String editManagerInfo(Manager manager, HttpSession session,
                                  HttpServletRequest request) {
        Manager newManager = (Manager) session.getAttribute("manager");
        newManager.setUsername(manager.getUsername());
        newManager.setEmail(manager.getEmail());
        newManager.setPhone(manager.getPhone());
        int i = manageService.updateManager(newManager);
        if (i >= 1) {
            session.setAttribute("manager", newManager);
            request.setAttribute("editInfosuccess", "更新成功");
        } else {
            request.setAttribute("editInfoerror", "更新失败");
        }
        return "system/manager/managerinfo";
    }

    /**
     * 跳转到管理员添加页面
     *
     * @param session
     * @return
     */
    @RequestMapping("/addManager")
    public String addManager(HttpSession session) {
        return "system/manager/addmanager";
    }

    /**
     * 获取所有管理员
     *
     * @param model
     * @return
     */
    @RequestMapping("/getManagerList")
    public String getManagerList(Model model,Page page) {
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Manager> mlist = manageService.findAll();
        int total = (int) new PageInfo<>(mlist).getTotal();
        page.setTotal(total);
        model.addAttribute("allmlist", mlist);
        model.addAttribute("page", page);
        return "system/manager/managerlist";
    }

    /**
     * 保存管理员
     *
     * @param manager
     * @param model
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/saveManager")
    public String saveManager(Manager manager, Model model, HttpSession session,
                              HttpServletRequest request, RedirectAttributes attr) {
        manager.setCreatedTime(DateFormat.getNewdate(date));
        manager.setPassword(EncryptByMD5.encrypt(manager.getPassword()));
        manager.setPhoto("profile-pic.jpg");
        manager.setStatus(1);
        manager.setRole(2);
        Manager mana = (Manager) session.getAttribute("manager");
        int i = manageService.saveManager(manager);
        if (i >= 1) {
            attr.addFlashAttribute("addMsuccess", "成功了！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("添加新的管理员！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getManagerList";
            } else
                attr.addFlashAttribute("logerror", "添加日志失败!");
            return "redirect:getManagerList";
        } else {
            request.setAttribute("addMerror", "失败了！");
            model.addAttribute("managers", manager);
            return "system/manager/addmanager";
        }
    }


    /**
     * 获取管理员详细信息页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getManager")
    public String getManager(Integer id, Model model) {
        Manager manager = manageService.getManagerById(id);
        model.addAttribute("manager", manager);
        return "system/manager/updatemanager";
    }

    /**
     * 更新管理员
     *
     * @param manager
     * @param model
     * @param session
     * @param attr
     * @return
     */
    @RequestMapping("/updateManager")
    public String updateManager(Manager manager, Model model,
                                HttpSession session, RedirectAttributes attr) throws Exception {
        Manager mana = (Manager) session.getAttribute("manager");
        Manager old = manageService.getManagerById(manager.getId());
        old.setEmail(manager.getEmail());
        old.setPhone(manager.getPhone());
        if(manager.getPassword().toString().length()>16) {
            old.setPassword(manager.getPassword());
        }
        else if(manager.getPassword().toString().length()<=16||manager.getPassword().toString().length()>=6) {
            old.setPassword(EncryptByMD5.encrypt(manager.getPassword()));
        }
        old.setUsername(manager.getUsername());
        int i = manageService.updateManager(old);
        if (i >= 1) {
            attr.addFlashAttribute("updatesuccess", "成功了！");
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
        } else {
            attr.addFlashAttribute("updateerror", "出错了!");
            Integer id = manager.getId();
            attr.addAttribute("id", id);
            return "redirect : getManager";
        }
    }

    /**
     * 删除管理员
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/delManager")
    public String delManager(Integer id, HttpSession session, RedirectAttributes attr) {
        Manager mana = (Manager) session.getAttribute("manager");
        int i = manageService.delManager(id);
        if (i >= 1) {
            attr.addFlashAttribute("delsuccess", "删除成功");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除管理员！");
            log.setType(1);
            log.setManager(mana);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getManagerList";
            } else
                attr.addFlashAttribute("logerror", "日志写入错误");
            return "redirect:getManagerList";
        } else {
            attr.addFlashAttribute("delerror", "失败");
            return "redirect:getManagerList";
        }
    }


    /**
     * 恢复已经删除的管理员
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/redelManager")
    public String redelManager(Integer id, HttpSession session, RedirectAttributes attr) {
        Manager mana = (Manager) session.getAttribute("manager");
        int i = manageService.reDelManager(id);
        if (i >= 1) {
            attr.addFlashAttribute("redelsuccess", "成功");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("恢复已经删除的管理员！");
            log.setType(1);
            log.setManager(mana);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getManagerList";
            } else
                attr.addFlashAttribute("logerror", "日志写入错误");
            return "redirect:getManagerList";
        } else {
            attr.addFlashAttribute("redelerror", "失败");
            return "redirect:getManagerList";
        }
    }


    /**
     * 根据字段查询管理员
     *
     * @param findname
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findbycondition")
    public String findbycondition(String findname, Model model, HttpSession session,HttpServletRequest request,
            Page page) {
        System.out.println("查找的字段为：" + findname);

        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Manager> findlist = manageService.findName("%" + findname + "%");
        int total = (int) new PageInfo<>(findlist).getTotal();
        page.setTotal(total);

        model.addAttribute("allmlist", findlist);
        model.addAttribute("page", page);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("查询管理员！");
        log.setManager((Manager) session.getAttribute("manager"));
        log.setType(1);
        int a = logService.addLog(log);
        if (a >= 1) {
            return "system/manager/managerlist";
        } else
            request.setAttribute("logerror", "出错了");
        return "system/manager/managerlist";
    }

}
