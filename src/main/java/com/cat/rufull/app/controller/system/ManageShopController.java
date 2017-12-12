package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Resource
    private AccountService accountService;
    @Resource
    private ShopService shopService;

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
        //List<Business> businessesList = businessService.findNotSettledShop();
        //model.addAttribute("notSettleShop", businessesList);
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
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        business.getAccount().setStatus(Business.BUSINESS_STATUS_SETTLED_PASS);
        //int i = businessService.updateById(business);
        //int i = accountService.updateBytAccount(business.getAccount());
        int i =1;
        if (i >= 1) {
            session.setAttribute("examsuccess","审核成功!");
            System.out.println(business.getAccount().getPhone()+":你好，您申请的商家已通过审核");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核通过！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getNotSettledShop";
            }else
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
     * @return
     * @throws Exception
     */
    @RequestMapping("/examineNotPass")
    public String examineNotPass(Business business, HttpSession session,RedirectAttributes attr) throws Exception{
        session.removeAttribute("npexamerror");
        session.removeAttribute("npexamsuccess");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
       // business.getAccount().setStatus(Business.BId(business.geUSINESS_STATUS_SETTLED_NOTPASS);
        //    int i = accountService.updateBytAccount(business.getAccount());
        int i = 1;
        if (i >= 1) {
            System.out.println(business.getAccount().getPhone()+":你好，您申请的商家未通过审核");
            session.setAttribute("npexamsuccess","审核结果为不通过!");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核不通过！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
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
     * 列出所有的商店
     * @param model
     * @return
     */
    @RequestMapping("/findBusiness")
    public String findBusiness(Model model){
        List<Shop> bussBusinessList = shopService.findAll();
        model.addAttribute("mshoplist",bussBusinessList);
        return "system/shop/allshop";
    }

    /**
     * 根据条件查询商家
     * @param condition
     * @param model
     * @return
     */
    @RequestMapping("/findByCondition")
    public String findByCondition(@RequestParam("condition") String condition, Model model) {

       //List<Shop> shop = shopService.fuzzyFindByShopName(condition);

        //        model.addAttribute("mshoplist",shop);
        return "system/shop/allshop";
    }

    /**
     * 根据id删除商家
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/delBusiness")
    public String delBusiness(Integer id,Model model,
                              HttpSession session) {
        session.removeAttribute("delBsuccess");
        session.removeAttribute("delBerror");
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Business business = businessService.findById(id);
        business.getAccount().setStatus(Business.BUSINESS_STATUS_DELETE);
//      int i = accountService.updateById(business.getAccount());
//        int i = businessService.updateById(business);
        int i = 1;
        if (i >= 1) {
            session.setAttribute("delBsuccess","删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员删除商家信息！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
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

