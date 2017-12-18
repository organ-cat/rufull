package com.cat.rufull.app.controller.payment;

import com.cat.rufull.domain.common.util.PaymentUtil;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;
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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

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
                          @RequestParam("total") BigDecimal total, // 支付金额
                          HttpServletResponse response) throws Exception{

        Order order = orderService.findOrderById(id); // 获取订单详情
        String orderNumber = order.getOrderNumber();   //获取订单编号
        if(order.getPaymentMethod().equals("ONLINE")){    //判断为在线支付
            // 付款:
            // 定义付款的参数:
            String p0_Cmd = "Buy";
            String p1_MerId = "10001126856";
            String p2_Order = orderNumber;
            String p3_Amt = "0.01";
            String p4_Cur = "CNY";
            String p5_Pid = "";
            String p6_Pcat = "";
            String p7_Pdesc = "";
            String p8_Url = "http://localhost:8080/rufull/payment/payBack";
            String p9_SAF = "";
            String pa_MP = "";
            String pr_NeedResponse = "1";
            String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
            String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, bank , pr_NeedResponse, keyValue);

            //拼接参数
            StringBuffer pay = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
            pay.append("p0_Cmd=").append(p0_Cmd).append("&");
            pay.append("p1_MerId=").append(p1_MerId).append("&");
            pay.append("p2_Order=").append(p2_Order).append("&");
            pay.append("p3_Amt=").append(p3_Amt).append("&");
            pay.append("p4_Cur=").append(p4_Cur).append("&");
            pay.append("p5_Pid=").append(p5_Pid).append("&");
            pay.append("p6_Pcat=").append(p6_Pcat).append("&");
            pay.append("p7_Pdesc=").append(p7_Pdesc).append("&");
            pay.append("p8_Url=").append(p8_Url).append("&");
            pay.append("p9_SAF=").append(p9_SAF).append("&");
            pay.append("pa_MP=").append(pa_MP).append("&");
            pay.append("pd_FrpId=").append(bank).append("&");
            pay.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
            pay.append("hmac=").append(hmac);

            //转发到第三方支付界面
            return "redirect:"+ pay.toString();
        }else{                                        //判断为货到付款
            return "redirect:/order/" + order.getId();
        }

    }

    /**
     * 付款成功后的回调方法
     * @param model  //包含支付结果
     * @param r1_Code//支付结果状态码，1为成功
     * @param r6_Order//支付订单号
     * @param r3_Amt//支付金额
     * @return
     */
    @RequestMapping("payBack")
    public String callBack(Model model, Integer r1_Code, String r6_Order, double r3_Amt){

        if(r1_Code == 1){ //支付结果：成功，跳转完成支付
            /*model.addAttribute("id",r6_Order);
            return complete(r6_Order);*/
            Order order = orderService.findOrderByOrderNumber(r6_Order);
            //System.out.println(order);
            orderService.paidOrder(order);
            return "forward:/order/" + order.getId();
        }else {           //支付失败
            model.addAttribute("error", "支付失败" + "待付金额为："+r3_Amt+"元");
            //model.addAttribute("orderMsg","您的订单号为："+r6_Order+"，付款金额："+r3_Amt);
            return "payment/error";
        }

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
