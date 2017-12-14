package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.common.util.DateFormat;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.managerlog.ManagerLogService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.expression.spel.ast.OpOr;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * Created by Luckily on 2017/12/7.
 */
@Controller
@RequestMapping("/ordermanage")
public class ManageOrderController {
    @Resource
    private OrderService orderService;

    @Resource
    private ManagerLogService logService;
    @Resource
    private AccountService accountService;
    @Resource
    private ShopService shopService;

    private ManageLog log = new ManageLog();
    private Date date = new Date();

    /**
     * 获取订单列表
     *
     * @param beginTime
     * @param endTime
     * @return
     */
    @RequestMapping("/getOrdersbycondition")
    public String getOrdersbycondition(String beginTime,
                                String endTime, Model model) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date begin = null;
        Date end = null;
        if(beginTime!=null&&beginTime!="") {
            begin = formatter.parse(beginTime);
        }if(endTime!=null&&endTime!=""){
            end = formatter.parse(endTime);
        }
        List<Order> orderList = orderService.findOrdersBetween(begin, end);
        System.out.println(beginTime+"***************************"+endTime);
        model.addAttribute("morderlist", orderList);
        return "system/order/ordersList";
    }
    /**
     * 获取所有订单列表
     *
     * @return
     */
    @RequestMapping("/findOrdersList")
    public String findOrdersList(Model model) {
        List<Order> orderList = orderService.findAllOrders();
        model.addAttribute("morderlist", orderList);
        return "system/order/ordersList";
    }

    /**
     * 获取订单详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/getOrder")
    public String getOrder(Integer id, Model model) {
        Order order = orderService.findOrderById(id);
        Account account = accountService.findAccountById(order.getAccountId());
        Shop shop = shopService.findById(order.getShop().getId());
        model.addAttribute("orderaccount",account);
        model.addAttribute("ordershop",shop);
        model.addAttribute("morder", order);
        return "system/order/orderdetail";
    }


    /**
     * 获得某一用户的个人订单
     *
     * @param accountid
     * @param model
     * @return
     */
    @RequestMapping("/getAccOrder")
    public String getAccOrder(Integer accountid, Model model,HttpSession session) {
        session.removeAttribute("logerror");
        Manager mana = (Manager) session.getAttribute("manager");
        Account account = new Account();
        account.setId(accountid);
        List<Order> list = orderService.findOrderByAccountId(accountid);
        log.setCreateTime(DateFormat.getNewdate(date));
        log.setDetail("管理员根据用户id查询该用户订单！");
        log.setManager(mana);
        log.setType(2);
        log.setAccount(account);
        int a = logService.addLog(log);
        if (a >= 1) {
            for (Order order : list) {
                model.addAttribute("morder", order);
            }
            return "system/order/accorder";
        } else
            session.setAttribute("logerror","出错了！");
            for (Order order : list) {
                model.addAttribute("morder", order);
            }
            return "system/order/accorder";
    }


}

