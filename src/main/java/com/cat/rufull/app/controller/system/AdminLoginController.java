package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.RegEx;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.system.ManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Luckily on 2017/12/10.
 */
@Controller
@RequestMapping("/adminLogin")
public class AdminLoginController {
    @Resource
    private ManageService manageService;

    /**
     * 跳转管理员登录界面
     * @return
     */
    @RequestMapping("/admin")
    public String adminLogin(HttpSession session) {
        return "system/managerlogin";
    }

    /**
     * 管理员登录
     * @param loginname
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/Login")
    public String Login(String loginname, String password, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("loginerror");
        Manager manager = new Manager();
        boolean isUsername = RegEx.regExUsername(loginname);
        boolean isPhone = RegEx.regExPhone(loginname);
        boolean isEmail = RegEx.regExEmail(loginname);
        manager.setPassword(password);
        if (isUsername) {
            manager.setUsername(loginname);
        }
        if (isPhone) {
            manager.setPhone(loginname);
        }
        if (isEmail) {
            manager.setEmail(loginname);
        }
        Manager mlogin = manageService.login(manager);
        if(mlogin!=null)
        {
            session.setAttribute("manager", mlogin);
            return "system/index";
        }
        else {
            attr.addFlashAttribute("loginerror", "管理员不存在");
            return "redirect:admin";
        }
    }
}
