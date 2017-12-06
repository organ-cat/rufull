package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.system.ManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

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

    /*跳转到管理员登录界面*/
    @RequestMapping("adminlogin")
    public String adminlogin() {
        return "system/managelogin";
    }

    /*管理员登录*/
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpSession session) {
        Manager manager = new Manager();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
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

    /*管理员退出登录*/
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("manager");
        return "system/managelogin";
    }

    /*跳转到添加管理员页面*/
    @RequestMapping("/addManager")
    public String saveManager(HttpSession session) {
        session.removeAttribute("adderror");
        return "system/manager/addmanager";
    }
    /*
    * 获取管理员列表*/
    @RequestMapping("/getManagerList")
    public String getManagerList(Model model){
        List<Manager> mlist = manageService.findAll();
        model.addAttribute("allmlist", mlist);
        return "system/manager/managerlist";
    }

    /*保存管理员*/
    @RequestMapping("/saveManager")
    public String saveManager(Manager manager, String password, Model model, HttpSession session) {
        session.removeAttribute("logerror");
        session.removeAttribute("adderror");
        Manager mana = (Manager) session.getAttribute("manager");

            int i = manageService.saveManager();
            if (i >= 1) {
                log.setCreateTime(DateFormat.getNewdate(date));
                log.setDetail("添加新的管理员！");
                log.setManager(mana);
                log.setType(1);
                int a = logService.addLog(log);
                if (a >= 1) {
                    return "redirect:manager/getManagerList";
                } else
                    session.setAttribute("logerror", "出错了");
                model.addAttribute("managers", manager);
                return "system/manager/addmanager";
            } else
                session.setAttribute("adderror", "出错了");
            model.addAttribute("managers", manager);
            return "system/manager/addmanager";
        }



    /*获取管理员的详细信息*/
    @RequestMapping("/getManager")
    public String getManager(@PathVariable Integer id, Model model, HttpSession session) {
        session.removeAttribute("updateerror");
        Manager manager = manageService.getManagerById(id);
        model.addAttribute("manager", manager);
        return "system/manager/updatemanager";
    }

    /*管理员更新操作*/
    @RequestMapping("/updateManager")
    public String updateManager(Manager manager, Model model,String password, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("updateerror");
        session.removeAttribute("logerror");

        Manager mana = (Manager) session.getAttribute("manager");

            Manager old = manageService.getManagerById(manager.getId());
            old.setEmail(manager.getEmail());
            old.setPhone(manager.getPhone());
            old.setUsername(manager.getUsername());
            old.setPhoto(manager.getPhoto());

            int i = manageService.saveOrUpdateManager(old);
            if (i >= 1) {

                log.setCreateTime(DateFormat.getNewdate(date));
                log.setDetail("修改管理员信息！");
                log.setManager(mana);
                log.setType(1);
                int a = logService.addLog(log);
                if (a >= 1) {
                    return "redirect:manager/getManagerList";
                } else
                    model.addAttribute("managers", manager);
                session.setAttribute("logerror", "出错了");
                Integer id = manager.getId();
                attr.addAttribute("id", id);
                return "redirect : manage/getManager";
            } else
                session.setAttribute("updateerror", "出错了");
            Integer id = manager.getId();
            attr.addAttribute("id", id);
            return "redirect : manage/getManager";
        }


    @RequestMapping("/delManager")
    public String delManager(String password,Integer id, Model model, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("delerror");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        int i = manageService.delManager(id);
        if (i >= 1) {
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除管理员！");
            log.setType(1);
            log.setManager(mana);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:manager/getManagerList";
            } else
                session.setAttribute("logerror", "出错了");
                return "redirect:manager/getManagerList";
        } else
                session.setAttribute("updateerror", "出错了");
                return "redirect:manager/getManagerList";
    }


    @RequestMapping("/uploadPic")
    public void uploadPic(HttpServletRequest request, String fileName, PrintWriter out) {
        //由于上传的图片是属于流类型的，request不能直接操作，需要将request强转为多部件请求对象
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        //根据文件的名称获取文件对象,对象类型要和springmvc配置的文件上传类型匹配
        CommonsMultipartFile commons = (CommonsMultipartFile) mRequest.getFile(fileName);
        //获取文件上传流
        byte[] bytes = commons.getBytes();
        //文件名在服务器中可能会重复，使用时间作为命名
        String newFileName = "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        newFileName = dateFormat.format(new Date());
        Random random = new Random();
        //取10以内的随机数
        for (int i = 0; i < 3; i++) {
            newFileName = newFileName + random.nextInt(10);
        }
        //获取文件的扩展名
        String originalFilename = commons.getOriginalFilename();
        //截取文件名称
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        /*//创建jerser服务器，实现跨服务器上传
        Client client = Client.create();
        //把文件关联到远程服务器上
        WebResource resource = client.resource(Commons.PIC_HOST+"/upload/"+newFileName+suffix);
        //上传
        resource.put(String.class, bytes);

        //ajax回调函数需要写的内容
        //图片需要回显，需要图片的完整路径
        //数据库需要保存图片的途径
        String fullPath = Commons.PIC_HOST+"/upload/"+newFileName+suffix;
        String relativePath ="/upload/"+newFileName+suffix;
        //模拟json{"":"","":""}
        String result = "{\"fullPath\":\""+fullPath+"\",\"relativePath\":\""+relativePath+"\"}";
        out.print(result);*/
    }

    @RequestMapping("/find")
    public String find(String findname, Model model, HttpSession session) {
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
            session.setAttribute("logerror", "出错了");
        return "system/manager/findlist";
    }

}
