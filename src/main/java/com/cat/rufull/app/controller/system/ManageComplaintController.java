package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.Page;
import com.cat.rufull.domain.common.util.SMS;
import com.cat.rufull.domain.model.Complaint;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.ComplaintService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.cat.rufull.domain.service.system.ManageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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
     *
     * @param model
     * @return
     */
    @RequestMapping("/findAllComp")
    public String findAllComp(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Complaint> complaintList = complaintService.findAllComplaint();
        int total = (int) new PageInfo<>(complaintList).getTotal();
        page.setTotal(total);
        model.addAttribute("managecomp", complaintList);
        model.addAttribute("page",page);
        return "system/complaint/allcomplaint";
    }

    /**
     * 查看已经处理的投诉
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/findSuccessComp")
    public String findSuccessComp(Model model, HttpSession session) {
        List<Complaint> complaintList = complaintService.completedComplaintList();
        model.addAttribute("managecomp", complaintList);
        return "system/complaint/findSuccessComp";
    }

    /**
     * 查看某一用户的投诉
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getAccComp")
    public String getAccComp(Integer id, Model model,
                             RedirectAttributes attr) {
        Complaint complaint = complaintService.findComplaintById(id);
        //Shop shop = shopService.findById(complaint.getShop().getId());
        //Account account = accountService.findAccountById(complaint.getAccount().getId());
        complaint.setStatus(Complaint.HANDLING);
        int i = complaintService.handlerComplaint(complaint.getId(), Complaint.HANDLING);
        if (i >= 1) {
            model.addAttribute("managecomp", complaint);
            //model.addAttribute("account", account);
            //model.addAttribute("shop", shop);
            return "system/complaint/accountcomplaint";
        } else {
            attr.addFlashAttribute("getacccomperror", "出错了");
            //model.addAttribute("account", account);
            //model.addAttribute("shop", shop);
            model.addAttribute("managecomp", complaint);
            return "redirect:findAllComp";
        }

    }

    /**
     * 获取处理后的评价详情
     *
     * @param id
     * @param model
     * @return
     */

    @RequestMapping("/getCompdetail")
    public String getCompdetail(Integer id, Model model) {
        Complaint complaint = complaintService.findComplaintById(id);
        //Shop shop = shopService.findById(complaint.getShop().getId());
        //Account account = accountService.findAccountById(complaint.getAccount().getId());
        Manager manager = manageService.getManagerById(complaint.getSolver());
        model.addAttribute("managecomp", complaint);
        //model.addAttribute("account", account);
        model.addAttribute("solver", manager);
        //model.addAttribute("shop", shop);
        return "system/complaint/compltedetail";
    }

    /**
     * 处理某一用户的投诉
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/replyComp")
    public String replyComp(Integer id, HttpSession session, RedirectAttributes attr) {

        Complaint complaint = complaintService.findComplaintById(id);
        //Account account = accountService.findAccountById(complaint.getAccount().getId());
        Manager mana = (Manager) session.getAttribute("manager");
        complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
        //1 处理成功  2投诉为假
        complaint.setResult(Complaint.RESULT_TRUE);
        complaint.setCompletedTime(DateFormat.getNewdate(date));
        complaint.setSolver(mana.getId());
        int i = complaintService.completedComplaint(complaint);
        if (i >= 1) {
            attr.addFlashAttribute("replysuccess", "处理成功，结果为真");
            SMS.sendNotification(complaint.getAccount().getPhone(),complaint.getAccount().getUsername(),"您好，您发起的投诉我们已经处理，处理结果为对该商家进行批评教育！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员处理" + complaint.getAccount().getUsername() + "用户投诉，结果为真！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(complaint.getAccount());
            int a = logService.addLog(log);
            if (a > 0) {
                return "redirect:findAllComp";
            } else {
                attr.addFlashAttribute("logerror", "出错了！");
                return "redirect:findAllComp";
            }
        } else {
            attr.addFlashAttribute("replyerror", "处理失败");
            attr.addAttribute("id", id);
            return "redirect:getAccComp";
        }
    }


    /**
     * 处理某一用户的投诉
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/replyfalseComp")
    public String replyfalseComp(Integer id, HttpSession session, RedirectAttributes attr) {

        Complaint complaint = complaintService.findComplaintById(id);
        //Account account = accountService.findAccountById(complaint.getAccount().getId());
        Manager mana = (Manager) session.getAttribute("manager");
        complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
        //1 处理成功  2投诉为假
        complaint.setResult(Complaint.RESULT_FAKE);
        complaint.setCompletedTime(DateFormat.getNewdate(date));
        complaint.setSolver(mana.getId());
        int i = complaintService.completedComplaint(complaint);
        if (i >= 1) {
            attr.addFlashAttribute("replysuccess", "处理成功，结果为假");
            SMS.sendNotification(complaint.getAccount().getPhone(),complaint.getAccount().getUsername(),"您好，您发起的投诉我们已经处理，由于该投诉与事实不符，所以我们否决了此次投诉请求！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员处理" + complaint.getAccount().getUsername() + "用户投诉,结果为假！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(complaint.getAccount());
            int a = logService.addLog(log);
            if (a > 0) {
                return "redirect:findAllComp";
            } else {
                attr.addFlashAttribute("logerror", "出错了！");
                return "redirect:findAllComp";
            }
        } else {
            attr.addFlashAttribute("replyerror", "处理失败");
            attr.addAttribute("id", id);
            return "redirect:getAccComp";
        }

    }


    /**
     * 一键处理部分用户的投诉
     *
     * @param id
     * @param session
     * @param result
     * @return
     */
    @RequestMapping("/replyAllComp")
    public String replyAllComp(Integer[] id, Integer result, HttpSession session, RedirectAttributes attr) {
        Manager mana = (Manager) session.getAttribute("manager");
        if (id != null) {
            for (Integer ids : id) {
                System.out.println(result + "," + ids + "--------------------------------------");
                Complaint complaint = complaintService.findComplaintById(ids);
                //Account account = accountService.findAccountById(complaint.getAccount().getId());
                complaint.setStatus(Complaint.COMPLETED_COMPLAINTION);
                //1 处理成功  2投诉为假
                complaint.setResult(result);
                complaint.setCompletedTime(DateFormat.getNewdate(date));
                complaint.setSolver(mana.getId());
                int i = complaintService.completedComplaint(complaint);
                if (i >= 1) {
                    if(result==1)
                    {
                        SMS.sendNotification(complaint.getAccount().getPhone(),complaint.getAccount().getUsername(),"您好，您发起的投诉我们已经处理，" +
                                "处理结果为对该商家进行批评教育！");
                    }
                    if(result == 2)
                    {
                        SMS.sendNotification(complaint.getAccount().getPhone(),complaint.getAccount().getUsername(),"您好，您发起的投诉我们已经处理，" +
                                "由于该投诉与事实不符，所以我们否决了此次投诉请求！");
                    }
                    attr.addFlashAttribute("replysuccess", "处理成功");
                    log.setCreateTime(DateFormat.getNewdate(date));
                    log.setDetail("管理员处理" + complaint.getAccount().getUsername() + "用户投诉！");
                    log.setManager(mana);
                    log.setType(2);
                    log.setAccount(complaint.getAccount());
                    int a = logService.addLog(log);
                    if (a < 0) {
                        attr.addFlashAttribute("logerror", "出错了！");
                    }
                } else {
                    attr.addFlashAttribute("replyerror", "处理失败");
                }
            }
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员一键处理用户投诉！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a < 0) {
                attr.addFlashAttribute("logerror", "出错了！");
            }
        }
        return "redirect:findAllComp";
    }

    /**
     * 根据时间段查找已经完成的投诉
     *
     * @param beginTime
     * @param endTime
     * @param ketword
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("checkComp")
    public String checkComp(String beginTime, String endTime,
                            String ketword, Model model,
                            HttpServletRequest request) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date begin = null;
        Date end = null;
        if (beginTime != null && beginTime != "") {
            begin = formatter.parse(beginTime);
        }
        if (endTime != null && endTime != "") {
            end = formatter.parse(endTime);
        }
        if (begin != null && end != null && begin.getTime() > end.getTime()) {
            request.setAttribute("timeerror", "时间错误");
            return "system/complaint/findSuccessComp";
        }
        List<Complaint> complaintList = complaintService.findComplaintByTime(begin, end, ketword);
        model.addAttribute("managecomp", complaintList);
        return "system/complaint/findSuccessComp";
    }


}
