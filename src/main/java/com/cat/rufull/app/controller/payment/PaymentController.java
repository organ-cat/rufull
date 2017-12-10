package com.cat.rufull.app.controller.payment;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.order.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/payment")
public class PaymentController {
    private static Logger logger = LoggerFactory.getLogger(PaymentController.class);

    private OrderService orderService;

    private MessageSource messageSource;

    private static final String SESSION_ACCOUNT = "account";

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String createForm(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以跳转到支付页面
            uiModel.addAttribute("order", order);
            return "payment/show";
        } else {
            uiModel.addAttribute("error","您只可以对自己的订单进行支付");
            return "payment/error";
        }
    }

    /**
     * 进行支付
     * @param id
     * @param bank
     * @param total
     * @return
     */
    @RequestMapping(value = "/process/{id}", method = RequestMethod.POST)
    public String process(@PathVariable("id") Integer id, // 订单id
                         @RequestParam("pd_FrpId") String bank, // 选择银行
                         @RequestParam("total") BigDecimal total // 支付金额
                        ) {
        // 省略了支付业务
        return complete(id);
    }

    /**
     * 完成支付,跳转订单详情页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/complete/{id}", method = RequestMethod.POST)
    public String complete(@PathVariable("id") Integer id) {
        Order order = orderService.findOrderById(id);
        orderService.paidOrder(order);

        return "redirect:/order/{id}";
    }

    /**
     * 判断登录用户是否为该订单的所有者(用户)
     * @param account 用户
     * @param order 订单
     * @return
     */
    private boolean isTheOrderOwner(Account account, Order order) {
        return account.getId().equals(order.getAccountId());
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    /**
     * 获取登录用户
     * @param session
     * @return 返回当前登录用户
     */
    private Account getSessionAccount(HttpSession session) {
        return (Account) session.getAttribute(SESSION_ACCOUNT);
    }
}
