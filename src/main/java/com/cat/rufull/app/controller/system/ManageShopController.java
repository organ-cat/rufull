package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.service.business.BusinessService;
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
 * Created by Luckily on 2017/12/7.
 */
@Controller
@RequestMapping("/manageShop")
public class ManageShopController {
    @Resource
    private BusinessService businessService;
    @Resource
    private ManagerLogService logService;

    private ManageLog log;
    private Date date = new Date();
    /**
     * 查看未入驻的商家
     *
     * @param model
     * @return
     */
    @RequestMapping("/getNotSettledBusiness")
    public String getNotSettledShop(Model model) {
        //List<Business> businessesList = businessService.getNotSettledShop();
        List<Business> businessesList = null;
        model.addAttribute("notSettleShop", businessesList);
        return "system/shop/notSettleShop";
    }

    /**
     * 获得商家的详细信息并跳转到审核页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getBusiness")
    public String getShop(@PathVariable Integer id, Model model) {
        Business business = businessService.findById(id);
        model.addAttribute("mbusiness", business);
        //business.getAccount().setStatus(Business.BUSINESS_STATUS_SETTLED_PASS);
        return "system/shop/examineShop";
    }

    /**
     * 审核通过
     * @param business
     * @param session
     * @param attr
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/examineShop")
    public String examineShop(Business business, HttpSession session,RedirectAttributes attr,
                              Model model) throws Exception{
        session.removeAttribute("examerror");
        session.removeAttribute("examsuccess");
        session.removeAttribute("examerror");

        Manager mana = (Manager) session.getAttribute("manager");
     //   business.getAccount().setStatus(Business.BUSINESS_STATUS_SETTLED_PASS);
        int i = businessService.updateById(business);
        if (i >= 1) {
            session.setAttribute("examsuccess","审核成功!");
            System.out.println(business.getAccount().getPhone()+":你好，您申请的商家已通过审核");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核通过！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getNotSettledShop";
            } else
                model.addAttribute("mbusiness", business);
                session.setAttribute("logerror","写入日志失败");
                return "redirect:getNotSettledShop";
        } else
            session.setAttribute("examerror","审核失败");
            Integer id = business.getId();
            attr.addAttribute("id", id);
            return "redirect : getBusiness";
        }

    /**
     * 审核不通过
     * @param business
     * @param session
     * @param attr
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/examineNotPass")
    public String examineNotPass(Business business, HttpSession session,RedirectAttributes attr,
                              Model model) throws Exception{
        session.removeAttribute("npexamerror");
        session.removeAttribute("npexamsuccess");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
      //  business.getAccount().setStatus(Business.BUSINESS_STATUS_SETTLED_NOTPASS);
        int i = businessService.updateById(business);
        if (i >= 1) {
            System.out.println(business.getAccount().getPhone()+":你好，您申请的商家未通过审核");
            session.setAttribute("npexamsuccess","审核结果为不通过!");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核不通过！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getNotSettledShop";
            } else
                session.setAttribute("logerror","日志写入失败!");
                return "redirect:getNotSettledShop";
        } else
            session.setAttribute("npexamerror","审核失败!");
        Integer id = business.getId();
        attr.addAttribute("id", id);
        return "redirect : getBusiness";
    }

    /**
     * 列出所有的商家
     * @param model
     * @return
     */
    @RequestMapping("/findBusiness")
    public String findBusiness(Model model){
        List<Business> bussBusinessList = businessService.findAll();
        model.addAttribute("mbusinesslist",bussBusinessList);
        return "system/shop/allbusiness";
    }

    @RequestMapping("/findByCondition")
    public String findByCondition(Integer type,String condition,Model model) {
       // List<Business> conditionBusiness= businessService.findByCondition(type,condition);
        List<Business> conditionBusiness= null;
        model.addAttribute("mbusinesslist",condition);
        return "system/shop/allbusiness";
    }

    @RequestMapping("/delBusiness")
    public String delBusiness(@PathVariable Integer id,Model model,
                              HttpSession session) {
        session.removeAttribute("delBsuccess");
        session.removeAttribute("delBerror");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Business business = businessService.findById(id);
        //business.getAccount().setStatus(Business.BUSINESS_STATUS_DELETE);
        int i = businessService.updateById(business);
        if (i >= 1) {
            session.setAttribute("delBsuccess","删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员删除商家信息！");
            log.setManager(mana);
            log.setType(1);
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:manageShop/findBusiness";
            } else
                model.addAttribute("mbusiness", business);
            session.setAttribute("logerror","写入日志失败！");
            return "redirect:manageShop/findBusiness";
        } else
            session.setAttribute("delBerror","失败了！");
        return "redirect:findBusiness";
    }

}

