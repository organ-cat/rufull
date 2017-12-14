package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.mapper.account.ComplaintMapper;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.ComplaintService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.cat.rufull.domain.service.system.ManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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
    @Resource
    private ShopService shopService;
    @Resource
    private ManageService manageService;

    private ManageLog log = new ManageLog();
    private Date date = new Date();

    /**
     * 查看用户的所有投诉
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findAllComp")
    public String findAllComp(Model model, HttpSession session) {
        session.removeAttribute("getacccomperror");
        List<Complaint> complaintList = complaintService.findAllComplaint();
        model.addAttribute("managecomp", complaintList);
        return "system/complaint/allcomplaint";
    }

    /**查看已经处理的投诉
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findSuccessComp")
    public String findSuccessComp(Model model, HttpSession session) {
        session.removeAttribute("getacccomperror");
        List<Complaint> complaintList = complaintService.completedComplaintList();
        model.addAttribute("managecomp", complaintList);
        return "system/complaint/findSuccessComp";
    }

    /**
     * 查看某一用户的投诉
     * @param id
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/getAccComp")
    public String getAccComp(Integer id,HttpSession session,Model model){
        session.removeAttribute("getacccomperror");
        Complaint complaint = complaintService.findComplaintById(id);
        Shop shop = shopService.findById(complaint.getShopId());
        Account account = accountService.findAccountById(complaint.getAccountId());
        complaint.setStatus(Complaint.HANDLING);
        int i = complaintService.handlerComplaint(complaint.getId(),Complaint.HANDLING);
        if (i >= 1) {
            model.addAttribute("managecomp", complaint);
            model.addAttribute("account", account);
            model.addAttribute("shop", shop);
            return "system/complaint/accountcomplaint";
        }
        else {
            session.setAttribute("getacccomperror", "出错了");
            model.addAttribute("account", account);
            model.addAttribute("shop", shop);
            model.addAttribute("managecomp", complaint);
            return "redirect:findAllComp";
        }

    }

    /**
     * 获取处理后的评价详情
     * @param id
     * @param session
     * @param model
     * @return
     */

    @RequestMapping("/getCompdetail")
    public String getCompdetail(Integer id,HttpSession session,Model model){
        Complaint complaint = complaintService.findComplaintById(id);
        Shop shop = shopService.findById(complaint.getShopId());
        Account account = accountService.findAccountById(complaint.getAccountId());
        Manager manager = manageService.getManagerById(complaint.getSolver());
        model.addAttribute("managecomp", complaint);
            model.addAttribute("account", account);
            model.addAttribute("solver",manager);
            model.addAttribute("shop", shop);
            return "system/complaint/compltedetail";
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
        complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
        //1 处理成功  2投诉为假
        complaint.setResult(Complaint.RESULT_TRUE);
        complaint.setCompletedTime(DateFormat.getNewdate(date));
        complaint.setSolver(mana.getId());
        int i = complaintService.completedComplaint(complaint);
        if (i >= 1) {
            session.setAttribute("replysuccess","处理成功，结果为真");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员处理"+account.getUsername()+"用户投诉，结果为真！");
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
     * 处理某一用户的投诉
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/replyfalseComp")
    public String replyfalseComp(Integer id,HttpSession session){
        session.removeAttribute("logerror");
        session.removeAttribute("replysuccess");
        session.removeAttribute("replyerror");

        Complaint complaint = complaintService.findComplaintById(id);
        Account account = accountService.findAccountById(complaint.getAccountId());
        Manager mana = (Manager) session.getAttribute("manager");
        complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
        //1 处理成功  2投诉为假
        complaint.setResult(Complaint.RESULT_FAKE);
        complaint.setCompletedTime(DateFormat.getNewdate(date));
        complaint.setSolver(mana.getId());
        int i = complaintService.completedComplaint(complaint);
        if (i >= 1) {
            session.setAttribute("replysuccess","处理成功，结果为假");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员处理"+account.getUsername()+"用户投诉,结果为假！");
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
     * @param id
     * @param session
     * @param result
     * @return
     */
    @RequestMapping("/replyAllComp")
    public String replyAllComp(Integer[] id,Integer result,HttpSession session){
        session.removeAttribute("logerror");
        session.removeAttribute("replysuccess");
        session.removeAttribute("replyerror");
        Manager mana = (Manager) session.getAttribute("manager");
        if(id!=null) {
            for (Integer ids : id) {
                System.out.println(result + "," + ids + "--------------------------------------");
                Complaint complaint = complaintService.findComplaintById(ids);
                Account account = accountService.findAccountById(complaint.getAccountId());
                complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
                //1 处理成功  2投诉为假
                complaint.setResult(result);
                complaint.setCompletedTime(DateFormat.getNewdate(date));
                complaint.setSolver(mana.getId());
                int i = complaintService.completedComplaint(complaint);
                if (i >= 1) {
                    session.setAttribute("replysuccess", "处理成功");
                    log.setCreateTime(DateFormat.getNewdate(date));
                    log.setDetail("管理员处理" + account.getUsername() + "用户投诉！");
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
        }
        return "redirect:findAllComp";
    }

    @RequestMapping("checkComp")
    public String checkComp(String beginTime,String endTime,
                            String ketword,Model model) throws  Exception{
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date begin = null;
        Date end = null;
        if(beginTime!=null&&beginTime!="") {
            begin = formatter.parse(beginTime);
        }if(endTime!=null&&endTime!=""){
            end = formatter.parse(endTime);
        }
        List<Complaint> complaintList = complaintService.findComplaintByTime(begin,end,ketword);
        model.addAttribute("managecomp",complaintList);
        return "system/complaint/findSuccessComp";
    }


}
