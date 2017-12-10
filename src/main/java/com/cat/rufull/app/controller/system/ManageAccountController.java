package com.cat.rufull.app.controller.system;

import com.aliyuncs.http.HttpRequest;
import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.EncryptByMD5;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Controller
@RequestMapping("/manageAcc")
public class ManageAccountController {

    @Resource
    private AccountService accountService;
    @Resource
    private ManagerLogService logService;

    private ManageLog log;
    private Date date = new Date();


    /**
     * 管理员获取用户的详细信息
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getAccount/{id}")
    public String getAccount(@PathVariable Integer id, Model model, HttpSession session) {
        session.removeAttribute("updateAccerror");
        Account account = accountService.findAccountById(id);
        model.addAttribute("maccount", account);
        return "system/account/updateaccount";
    }

    /**
     * 管理员获取用户列表
     * @param model
     * @return
     */
    @RequestMapping("/getAccountList")
    public String getAccountlist(Model model){
        List<Account> mlist = accountService.findAllAccount();
        model.addAttribute("allalist", mlist);
        return "system/account/accountlist";
    }

    /**
     * 管理员更新用户
     * @param account
     * @param session
     * @param attr
     * @return
     */
    @RequestMapping("/updateacccount")
    public String updateManager(Account account, HttpSession session, RedirectAttributes attr) {
        session.removeAttribute("updateAccerror");
        session.removeAttribute("updateAccsuccess");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Account old = accountService.findAccountById(account.getId());
        old.setUsername(account.getUsername());
       // old.setPassword(EncryptByMD5.encrypt(account.getPassword()));
        old.setPassword(account.getPassword());
        old.setPhone(account.getPhone());
        old.setEmail(account.getEmail());
        int i = accountService.mUpdateAccount(old);
        if (i >= 1) {
            session.setAttribute("updateAccsuccess", "更新成功了");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("修改用户信息！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(old);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getAccountList";
            } else {
                session.setAttribute("logerror", "日志写入失败");
                Integer id = account.getId();
                attr.addAttribute("id", id);
                return "redirect : getAccount";
            }
        } else {
            session.setAttribute("updateAccerror", "更新失败了");
            Integer id = account.getId();
            attr.addAttribute("id", id);
            return "redirect : getAccount";
        }
    }

    /**
     * 管理员删除用户
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/delaccount/{id}")
    public String delManager(@PathVariable Integer id, HttpSession session){
        session.removeAttribute("delAccerror");
        session.removeAttribute("delAccsuccess");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Account account = new Account();
        account.setId(id);
        int i = accountService.mdelAccount(id);
        if (i >= 1) {
            session.setAttribute("delAccsuccess","删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除用户！");
            log.setManager((Manager) session.getAttribute("manager"));
            log.setType(2);
            log.setAccount(account);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getAccountList";
            } else
                session.setAttribute("logerror","日志写入失败！");
                return "redirect:manageAcc/getAccountList";
        } else
            session.setAttribute("delAccerror","删除失败！");
            return "redirect:getAccountList";
    }

    /**
     * 管理员通过某一字段查询用户
     * @param findname
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findaccount")
    public String find(@RequestParam("findname") String findname, Model model, HttpSession session){
        session.removeAttribute("logerror");
        List<Account> findlist = accountService.findName(findname);
        model.addAttribute("allalist", findlist);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("查询用户！");
        log.setManager((Manager) session.getAttribute("manager"));
        log.setType(2);
        int a = logService.addLog(log);
        if (a >= 1) {
            return "system/account/accountlist";
        } else
            session.setAttribute("logerror","出错了");
        return "system/account/accountlist";
    }

}
