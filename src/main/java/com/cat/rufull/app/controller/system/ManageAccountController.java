package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.Page;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    private ManageLog log = new ManageLog();
    private Date date = new Date();


    /**
     * 管理员获取用户的详细信息
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getAccount")
    public String getAccount(Integer id, Model model, HttpSession session) {
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
    public String getAccountlist(Model model, Page page){
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Account> mlist = accountService.findAllAccount();
        int total = (int) new PageInfo<>(mlist).getTotal();
        page.setTotal(total);
        model.addAttribute("allalist", mlist);
        model.addAttribute("page",page);
        return "system/account/accountlist";
    }


    /**
     * 跳转到查询用户界面
     * @return
     */
    @RequestMapping("/getcheckAccount")
    public String getcheckAccount(){
        return "system/account/checkaccount";
    }

    /**
     * 管理员更新用户
     * @param account
     * @param session
     * @param attr
     * @return
     */
    @RequestMapping("/updateacccount")
    public String updateManager(Account account, HttpSession session, RedirectAttributes attr,
                                HttpServletRequest request) {
        Manager mana = (Manager) session.getAttribute("manager");
        Account old = accountService.findAccountById(account.getId());
        old.setUsername(account.getUsername());
       // old.setPassword(EncryptByMD5.encrypt(account.getPassword()));
        old.setPassword(account.getPassword());
        old.setPhone(account.getPhone());
        old.setEmail(account.getEmail());
        int i = accountService.mUpdateAccount(old);
        if (i >= 1) {
            attr.addFlashAttribute("updateAccsuccess","更新成功");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("修改用户信息！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(old);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getAccountList";
            } else {
                attr.addFlashAttribute("logerror", "日志写入失败");
                Integer id = account.getId();
                attr.addAttribute("id", id);
                return "redirect : getAccount";
            }
        } else {
            attr.addFlashAttribute("updateAccerror", "更新失败了");
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
    @RequestMapping("/delaccount")
    public String delManager(Integer id, HttpSession session,RedirectAttributes attr){
        Manager mana = (Manager) session.getAttribute("manager");
        Account account = new Account();
        account.setId(id);
        int i = accountService.mdelAccount(id);
        if (i >= 1) {
            attr.addFlashAttribute("delAccsuccess","删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("删除用户！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(account);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getAccountList";
            } else
                attr.addFlashAttribute("logerror","日志写入失败！");
                return "redirect:manageAcc/getAccountList";
        } else
            attr.addFlashAttribute("delAccerror","删除失败！");
            return "redirect:getAccountList";
    }

    /**
     * 管理员恢复删除用户
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/redelaccount")
    public String redelManager(Integer id, HttpSession session,RedirectAttributes attr){
        Manager mana = (Manager) session.getAttribute("manager");
        Account account = new Account();
        account.setId(id);
        int i = accountService.mredelAccount(id);
        if (i >= 1) {
            attr.addFlashAttribute("redelAccsuccess","恢复删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("恢复删除用户！");
            log.setManager((Manager) session.getAttribute("manager"));
            log.setType(2);
            log.setAccount(account);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getAccountList";
            } else
                attr.addFlashAttribute("logerror","日志写入失败！");
            return "redirect:manageAcc/getAccountList";
        } else
            attr.addFlashAttribute("redelAccerror","恢复删除失败！");
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
    public String findaccount(String findname, Model model, HttpSession session,
                              RedirectAttributes attr){
        Manager mana = (Manager) session.getAttribute("manager");
        List<Account> findlist = accountService.findName(findname);
        model.addAttribute("allalist", findlist);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("查询用户！");
        log.setManager(mana);
        log.setType(2);
        int a = logService.addLog(log);
        if (a >= 1) {
            return "system/account/checkaccount";
        } else {
            attr.addFlashAttribute("logerror","出错了");
        }
        return "system/account/checkaccount";
    }

}
