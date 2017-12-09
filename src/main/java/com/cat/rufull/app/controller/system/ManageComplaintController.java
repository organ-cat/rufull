package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.mapper.account.ComplaintMapper;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Complaint;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.ComplaintService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/8.
 */
@Controller
@RequestMapping("/ManageCom")
public class ManageComplaintController {
    @Resource
    private ComplaintService complaintService;
    @Resource
    private ManagerLogService logService;
    @Resource
    private AccountService accountService;

    private ManageLog log;
    private Date date = new Date();

    /**
     * 查看用户的所有投诉
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findAllComp")
    public String findAllComp(Model model, HttpSession session) {
        session.removeAttribute("logerror");
        session.removeAttribute("getcomperror");
        List<Complaint> complaintList = complaintService.findAllComplaint();
        List<Complaint> processingComp = new ArrayList<Complaint>();
        Manager mana = (Manager) session.getAttribute("manager");
        for (Complaint complaint : complaintList) {
            complaint.setStatus(2);
            int i = complaintService.handlerComplaint(complaint.getId(),2);
            if (i >= 1) {
                    processingComp.add(complaint);
                    model.addAttribute("managecomp", complaintList);
                }
             else {
                session.setAttribute("getcomperror", "出错了");
                model.addAttribute("managecomp", complaintList);
            }
        }
        return "system/complaint/allcomplaint";
    }

    /**
     * 处理某一用户的投诉
     * @param id
     * @param session
     * @return
     */

    @RequestMapping("/replyComp")
    public String replyComp(Integer id,HttpSession session){
        session.removeAttribute("logerror");
        session.removeAttribute("replysuccess");
        session.removeAttribute("replyerror");

        Complaint complaint = complaintService.findComplaintById(id);
        Account account = accountService.findAccountById(complaint.getAccountId());
        Manager mana = (Manager) session.getAttribute("manager");
        complaint.setStatus(3);
        //1 处理成功  2投诉为假
        complaint.setResult(1);
        complaint.setCompletedTime(DateFormat.getNewdate(date));
        complaint.setSolver(mana.getId());
        int i = complaintService.completedComplaint(complaint);
        if (i >= 1) {
            session.setAttribute("replysuccess","处理成功");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员处理"+account.getUsername()+"用户投诉！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(account);
            int a = logService.addLog(log);
            if (a > 0) {
                return "redirect:findAllComp";
            } else {
                session.setAttribute("logerror", "出错了！");
                return "redirect:findAllComp";
            }
        } else {
            session.setAttribute("replyerror","处理失败");
            return "redirect:findAllComp";
        }
    }


    /**
     * 一键处理部分用户的投诉
     * @param ids
     * @param session
     * @return
     */
    @RequestMapping("/replyAllComp")
    public String replyAllComp(Integer[] ids,HttpSession session){
        session.removeAttribute("logerror");
        session.removeAttribute("replysuccess");
        session.removeAttribute("replyerror");
        Manager mana = (Manager) session.getAttribute("manager");

        for (Integer id : ids) {
            Complaint complaint = complaintService.findComplaintById(id);
            Account account = accountService.findAccountById(complaint.getAccountId());
            complaint.setStatus(3);
            //需要 complaintService提供updateComp(complaint) 方法
            //int i = complaintService.updateComp(complaint);
            int i = 1;
            if (i >= 1) {
                session.setAttribute("replysuccess", "处理成功");
                log.setCreateTime(DateFormat.getNewdate(date));
                log.setDetail("管理员处理"+account.getUsername()+"用户投诉！");
                log.setManager(mana);
                log.setType(2);
                log.setAccount(account);
                int a = logService.addLog(log);
                if (a < 0) {
                    session.setAttribute("logerror", "出错了！");
                }
            } else {
                session.setAttribute("replyerror", "处理失败");
            }
        }
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("管理员一键处理用户投诉！");
        log.setManager(mana);
        log.setType(1);
        int a = logService.addLog(log);
        if (a < 0) {
            session.setAttribute("logerror", "出错了！");
        }
        return "redirect:findAllComp";
    }



}
