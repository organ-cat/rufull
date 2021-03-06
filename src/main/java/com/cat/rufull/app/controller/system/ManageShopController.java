package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.common.util.Page;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    private ManageLog log = new ManageLog();
    private Date date = new Date();

    /**
     * 查看未入驻的商家
     *
     * @param model
     * @return
     */
    @RequestMapping("/getNotSettledBusiness")
    public String getNotSettledShop(Model model, Page page) {
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Business> businessesList = businessService.findNotSettledBusiness();
        int total = (int) new PageInfo<>(businessesList).getTotal();
        page.setTotal(total);
        model.addAttribute("notSettleShop", businessesList);
        model.addAttribute("page",page);
        return "system/shop/notSettleShop";
    }

    /**
     * 获得商家的详细信息并跳转到审核页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getBusiness")
    public String getShop(Integer id, Model model) {
        Business business = businessService.findById(id);
        model.addAttribute("mbusiness", business);
        return "system/shop/examineShop";
    }

    /**
     * 审核通过
     *
     * @param session
     * @param attr
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/examineShop")
    public String examineShop(Integer id, HttpSession session, RedirectAttributes attr,
                              Model model) throws Exception {
        Business business = businessService.findById(id);
        Manager mana = (Manager) session.getAttribute("manager");
        business.getAccount().setStatus(Business.BUSINESS_STATUS_SETTLED_PASS);
        int i = accountService.updateAccountStatus(business.getAccount().getId(), business.getAccount().getStatus());
        if (i >= 1) {
            attr.addFlashAttribute("examsuccess", "审核成功!");
            System.out.println(business.getAccount().getPhone() + ":你好，您申请的商家已通过审核");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核通过！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getNotSettledBusiness";
            } else
                model.addAttribute("mbusiness", business);
            attr.addFlashAttribute("logerror", "写入日志失败");
            return "redirect:getNotSettledBusiness";
        } else {
            attr.addFlashAttribute("examerror", "审核失败");
            attr.addAttribute("id", id);
            return "redirect : getBusiness";
        }
    }

    /**
     * 审核不通过
     *
     * @param session
     * @param attr
     * @return
     * @throws Exception
     */
    @RequestMapping("/examineNotPass")
    public String examineNotPass(Integer id, HttpSession session, RedirectAttributes attr) throws Exception {
        Business business = businessService.findById(id);
        Manager mana = (Manager) session.getAttribute("manager");
        business.getAccount().setStatus((Business.BUSINESS_STATUS_SETTLED_NOTPASS));
        int i = accountService.updateAccountStatus(business.getAccount().getId(), business.getAccount().getStatus());
        if (i >= 1) {
            System.out.println(business.getAccount().getPhone() + ":你好，您申请的商家未通过审核");
            attr.addFlashAttribute("npexamsuccess", "审核结果为不通过!");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("审核商家信息，审核不通过！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:getNotSettledBusiness";
            } else {
                attr.addFlashAttribute("logerror", "日志写入失败!");
                return "redirect:getNotSettledBusiness";
            }
        } else {
            attr.addFlashAttribute("npexamerror", "审核失败!");
            attr.addAttribute("id", id);
            return "redirect : getBusiness";
        }
    }

    /**
     * 列出所有的商店
     *
     * @param model
     * @return
     */
    @RequestMapping("/findBusiness")
    public String findBusiness(Model model) {
        List<Shop> shopList = new ArrayList<Shop>();
        List<Business> List = businessService.findAll();
        if (List != null) {
            for (Business business : List) {
                if (business.getAccount().getStatus() == 201) {
                    Shop shop = new Shop();
                    shop.setBusiness(business);
                    shopList.add(shop);
                }
            }
        }
        List<Shop> bussBusinessList = shopService.findAllShop();
        if (bussBusinessList != null) {
            for (Shop shop : bussBusinessList) {
                if (shop.getBusiness().getAccount().getStatus() == 202 ||
                        shop.getBusiness().getAccount().getStatus() == 203 || shop.getBusiness().getAccount().getStatus() == 204
                        ) {
                    shopList.add(shop);
                }
            }
        }
        model.addAttribute("mshoplist", shopList);
        return "system/shop/allshop";
    }

    /**
     * 根据条件查询商家
     *
     * @param condition
     * @param model
     * @return
     */
    @RequestMapping("/findByCondition")
    public String findByCondition(String condition, Model model) {
        List<Shop> shop = shopService.fuzzyFindByShopName(condition);
        model.addAttribute("mshoplist", shop);
        return "system/shop/allshop";
    }

    /**
     * 根据id删除商家
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/delBusiness")
    public String delBusiness(Integer id, Model model,
                              HttpSession session, RedirectAttributes attr) {
        Manager mana = (Manager) session.getAttribute("manager");
        Business business = businessService.findById(id);
        business.getAccount().setStatus(Business.BUSINESS_STATUS_DELETE);
        Shop shop = shopService.findShopByBusinessId(business.getId());
        if (shop != null) {
            shop.setOperateState(Shop.SHOP_STATUS_DELETE);
            shopService.updateById(shop);
        }
        int i = accountService.updateAccountStatus(business.getAccount().getId(), business.getAccount().getStatus());
        if (i >= 1) {
            attr.addFlashAttribute("delBsuccess", "删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员删除商家！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:findBusiness";
            } else {
                model.addAttribute("mbusiness", business);
                attr.addFlashAttribute("logerror", "写入日志失败！");
                return "redirect:findBusiness";
            }
        } else {
            attr.addFlashAttribute("delBerror", "失败了！");
            return "redirect:findBusiness";
        }
    }


    /**
     * 根据id令商店停业整顿
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/rogBusiness")
    public String rogBusiness(Integer id, Model model,
                              HttpSession session, RedirectAttributes attr) {
        Manager mana = (Manager) session.getAttribute("manager");
        Business business = businessService.findById(id);
        business.getAccount().setStatus(Business.BUSINESS_STATUS_RECITIFY);
        Shop shop = shopService.findShopByBusinessId(business.getId());
        shop.setOperateState(Shop.SHOP_STATUS_RETIFY);
        shopService.updateById(shop);
        int i = accountService.updateAccountStatus(business.getAccount().getId(), business.getAccount().getStatus());
        if (i >= 1) {
            attr.addFlashAttribute("rogBsuccess", "删除成功！");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员设置商家为整顿中！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:findBusiness";
            } else {
                model.addAttribute("mbusiness", business);
                attr.addFlashAttribute("logerror", "写入系统日志失败！");
                return "redirect:findBusiness";
            }
        } else {
            attr.addFlashAttribute("rogBerror", "失败了！");
            return "redirect:findBusiness";
        }
    }

    /**
     * 恢复商家
     *
     * @param id
     * @param session
     * @param attr
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/redelBusiness")
    public String redelBusiness(Integer id, HttpSession session, RedirectAttributes attr,
                                Model model) throws Exception {
        Business business = businessService.findById(id);
        Manager mana = (Manager) session.getAttribute("manager");
        Shop shop = shopService.findShopByBusinessId(business.getId());
        shop.setOperateState(Shop.SHOP_STATUS_NORMAL);
        shopService.updateById(shop);
        business.getAccount().setStatus(Business.BUSINESS_STATUS_CREATED_SHOP);
        int i = accountService.updateAccountStatus(business.getAccount().getId(), business.getAccount().getStatus());
        if (i >= 1) {
            attr.addFlashAttribute("redelsuccess", "审核成功!");
            System.out.println(business.getAccount().getPhone() + ":你好，您申请的商家已通过审核");
            log.setCreateTime(DateFormat.getNewdate(date));
            log.setDetail("管理员恢复商家入驻！");
            log.setManager(mana);
            log.setType(2);
            log.setAccount(business.getAccount());
            int a = logService.addLog(log);
            if (a >= 1) {
                return "redirect:findBusiness";
            } else {
                model.addAttribute("mbusiness", business);
                attr.addFlashAttribute("logerror", "写入日志失败");
                return "redirect:findBusiness";
            }
        } else {
            attr.addFlashAttribute("redelerror", "操作失败");
            attr.addAttribute("id", id);
            return "redirect : findBusiness";
        }
    }


}

