package com.cat.rufull.app.user;

import com.cat.rufull.domain.model.User;
import com.cat.rufull.domain.service.user.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;

    @RequestMapping("/showUser")
    public String toIndex(HttpServletRequest request,Model model){
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.findById(userId);
        model.addAttribute("user", user);
        System.out.println(user.getUserName());
        return "showUser";
    }
}
