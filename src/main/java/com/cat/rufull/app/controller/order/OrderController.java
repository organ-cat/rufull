package com.cat.rufull.app.controller.order;

import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.account.AddressService;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    private static Logger logger = LoggerFactory.getLogger(OrderController.class);

    private OrderService orderService;

    private ShopService shopService;

    private BusinessService businessService;

    private AddressService addressService;

    private MessageSource messageSource;

    private static final String SESSION_ACCOUNT = "account";

    @Autowired
    protected Carts carts;

    @RequestMapping(method = RequestMethod.GET)
    public String list(HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        List<Order> orders =
                orderService.findOrderByAccountId(account.getId()); // 查询该用户的所有订单

        uiModel.addAttribute("orders", orders);

        return "order/list";
    }

    @RequestMapping(value = "/unrated", method = RequestMethod.GET)
    public String listUnrated(HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        List<Order> orders =
                orderService.findUnratedOrderByAccountId(account.getId()); // 查询该用户的所有待评价订单

        uiModel.addAttribute("orders", orders);

        return "order/list";
    }

    @RequestMapping(value = "/refund", method = RequestMethod.GET)
    public String listRefund(HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        List<Order> orders =
                orderService.findRefundOrderByAccountId(account.getId()); // 查询该用户的所有退单记录

        uiModel.addAttribute("orders", orders);

        return "order/list";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以查看订单详情
            uiModel.addAttribute("order", order);
            return "order/show";
        } else {
            uiModel.addAttribute("error","您只可以查询自己的订单");
            return "order/error";
        }
    }

    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.POST)
    public String cancel(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以取消订单
            orderService.cancelOrder(order);
            uiModel.addAttribute("order", order);
            return "redirect:/order/{id}";
        } else {
            uiModel.addAttribute("error","您只可以取消自己的订单");
            return "order/error";
        }
    }

    @RequestMapping(value = "/confirm/{id}", method = RequestMethod.POST)
    public String confirm(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以确认收货
            orderService.confirmOrder(order);
            uiModel.addAttribute("order", order);
            return "redirect:/order/{id}";
        } else {
            uiModel.addAttribute("error","您只可以确认自己的订单");
            return "order/error";
        }
    }

    @RequestMapping(value = "/refund/{id}", method = RequestMethod.POST)
    public String refund(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以退单
            orderService.refundOrder(order);
            uiModel.addAttribute("order", order);
            return "redirect:/order/{id}";
        } else {
            uiModel.addAttribute("error","您只可以退自己的订单");
            return "order/error";
        }
    }

    @RequestMapping(value = "/cancelRefund/{id}", method = RequestMethod.POST)
    public String cancelRefund(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以取消退单
            orderService.cancelRefundOrder(order);
            uiModel.addAttribute("order", order);
            return "redirect:/order/{id}";
        } else {
            uiModel.addAttribute("error","您只可以取消自己退的订单");
            return "order/error";
        }
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(Order order, HttpSession session, Model uiModel) {
        // 为订单设置商家信息
        Shop shop = shopService.findById(order.getShop().getId());
        order.setBusinessId(shop.getBusiness().getId());

        orderService.submitOrder(order); // 下单
        carts.clearCart(order.getShop().getId()); // 清空该商店的购物车
        return "redirect:/payment/" + order.getId(); // 跳转到支付页面
    }

    @RequestMapping(value = "/accept/{id}", method = RequestMethod.POST)
    public String accept(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderKeeper(account, order)) { // 该订单属于该登录商家
            orderService.acceptOrder(order); // 接单
            uiModel.addAttribute("order", order);
            return null;
        } else {
            uiModel.addAttribute("error","您只可以接自己的订单");
            return "order/error";
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

    /**
     * 判断登录用户是否该订单的管理者(商家)
     * @param account 商家用户
     * @param order 订单
     * @return
     */
    private boolean isTheOrderKeeper(Account account, Order order) {
//        Business business =
//                businessService.findBusinessByAccountId(account.getId()); // 获取登录商家
//        return business.getId().equals(order.getBusinessId());
        return true;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setShopService(ShopService shopService) {
        this.shopService = shopService;
    }

    @Autowired
    public void setBusinessService(BusinessService businessService) {
        this.businessService = businessService;
    }

    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
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

    // 测试用户
    @RequestMapping(value = "/login/{id}", method = RequestMethod.GET)
    public String login(@PathVariable("id") Integer id, HttpSession session) {
        Account account = new Account();
        account.setId(id);

        session.setAttribute(SESSION_ACCOUNT, account);

        return "redirect:/order";
    }

    public void listOrder(List<Order> orders) {
        for (Order order : orders) {
            showOrder(order);
        }
    }

    public void showOrder(Order order) {
        System.out.println(order);

        System.out.println("  The order's shop is: ");
        System.out.println("    " + order.getShop());

        System.out.println("  The order's address is: ");
        System.out.println("    " + order.getAddress());

        System.out.println("  The order's items are: ");
        for (LineItem lineItem: order.getLineItems()) {
            System.out.println("    " + lineItem);
        }
    }
}
