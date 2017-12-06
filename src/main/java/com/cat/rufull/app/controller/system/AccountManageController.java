package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Controller
@RequestMapping("manageAcc")
public class AccountManageController {

    @Resource
    private AccountService accountService;
    @Resource
    private ManagerLogService logService;

    private ManageLog log;
    private Date date = new Date();




    /*获取用户的详细信息*/
    @RequestMapping("/getAccount")
    public String getAccount(@PathVariable Integer id, Model model, HttpSession session) {
        session.removeAttribute("updateAccerror");
        Account account = accountService.findAccountById(id);
        model.addAttribute("maccount", account);
        return "system/account/updateaccount";
    }

    /*获取用户列表*/
    @RequestMapping("/getAccountList")
    public String getAccountlist(Model model){
        List<Account> mlist = accountService.findAllAccount();
        model.addAttribute("allalist", mlist);
        return "system/account/accountlist";
    }
    /*用户更新操作*/
    @RequestMapping("/updateManager")
    public String updateManager(String password,Account account, Model model, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("updateAccerror");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Account old = accountService.findAccountById(account.getId());
        old.setEmail(account.getEmail());
        old.setNickname(account.getNickname());
        old.setPhoto(account.getPhoto());

        int i = accountService.mUpdateAccount(old);
        if (i >= 1) {

            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("修改用户信息！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:manageAcc/getAccountList";
            } else
                session.setAttribute("logerror", "出错了");
            Integer id = account.getId();
            attr.addAttribute("id", id);
            return "redirect : manageAcc/getAccount";
        } else
            session.setAttribute("updateAccerror", "出错了");
        Integer id = account.getId();
        attr.addAttribute("id", id);
        return "redirect : manageAcc/getAccount";
    }
/*管理员删除用户*/
    @RequestMapping("/delaccount")
    public String delManager(String password,Integer id, Model model, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("delaccerror");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        int i = accountService.mdelAccount(id);
        if (i >= 1) {
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除用户！");
            log.setManager((Manager) session.getAttribute("manager"));
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:manageAcc/getAccountList";
            } else
                session.setAttribute("logerror", "出错了");
                return "redirect:manageAcc/getAccountList";
        } else
            session.setAttribute("delaccerror", "出错了");
            return "redirect:manageAcc/getAccountList";
    }

/*通过字段查询用户*/
    @RequestMapping("/findaccount")
    public String find(String findname, Model model,HttpSession session) {
        session.removeAttribute("logerror");
        List<Account> findlist = accountService.findName(findname);
        model.addAttribute("findAcclist", findlist);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("查询用户！");
        log.setManager((Manager) session.getAttribute("manager"));
        log.setType(1);
        int a = logService.addLog(log);
        if (a >= 1) {
            return "system/account/findlist";
        } else
            session.setAttribute("logerror", "出错了");
        return "system/account/findlist";
    }

}
