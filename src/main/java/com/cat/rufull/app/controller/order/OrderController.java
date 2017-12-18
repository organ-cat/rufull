package com.cat.rufull.app.controller.order;

import com.cat.rufull.domain.common.exception.order.BusinessProcessingOrderException;
import com.cat.rufull.domain.common.exception.order.UserProcessingOrderException;
import com.cat.rufull.domain.common.util.PaginationResult;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.business.BusinessService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    private static Logger logger = LoggerFactory.getLogger(OrderController.class);

    private OrderService orderService;

    private ShopService shopService;

    private BusinessService businessService;

    private MessageSource messageSource;

    private static final String SESSION_ACCOUNT  = "account";
    private static final String SESSION_BUSINESS = "business";

    @Autowired
    protected Carts carts;

    @RequestMapping(method = RequestMethod.GET, headers = "Accept=text/html")
    public String list(Model uiModel) {
        uiModel.addAttribute("ordersUrl", "");
        uiModel.addAttribute("order_head", "近三个月订单");

        return "order/list";
    }

    @RequestMapping(method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody
    PaginationResult list(int offset, int limit, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户

        Page<Object> page = PageHelper.offsetPage(offset, limit);

        List<Order> orders =
                orderService.findOrderByAccountId(account.getId()); // 查询该用户的所有订单

        return new PaginationResult(page.getTotal(), orders);
    }

    @RequestMapping(value = "/unrated", method = RequestMethod.GET, headers = "Accept=text/html")
    public String listUnrated(Model uiModel) {
        uiModel.addAttribute("ordersUrl", "unrated");
        uiModel.addAttribute("order_head", "待评价订单");

        return "order/list";
    }

    @RequestMapping(value = "/unrated", method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody
    PaginationResult listUnrated(int offset, int limit, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户

        Page<Object> page = PageHelper.offsetPage(offset, limit);

        List<Order> orders =
                orderService.findUnratedOrderByAccountId(account.getId()); // 查询该用户的所有待评价订单

        return new PaginationResult(page.getTotal(), orders);
    }

    @RequestMapping(value = "/refund", method = RequestMethod.GET, headers = "Accept=text/html")
    public String listRefund(Model uiModel) {
        uiModel.addAttribute("ordersUrl", "refund");
        uiModel.addAttribute("order_head", "退单记录");

        return "order/list";
    }

    @RequestMapping(value = "/refund", method = RequestMethod.GET, headers = "Accept=application/json")
    public @ResponseBody
    PaginationResult listRefund(int offset, int limit, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户

        Page<Object> page = PageHelper.offsetPage(offset, limit);

        List<Order> orders =
                orderService.findRefundOrderByAccountId(account.getId()); // 查询该用户的所有退单记录

        return new PaginationResult(page.getTotal(), orders);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (!isTheOrderOwner(account, order)) // 当该订单不属于登录用户时,抛出异常
            throw new UserProcessingOrderException("您只可以查询自己的订单");

        uiModel.addAttribute("order", order);
        return "order/show";
    }

    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.POST)
    public String cancel(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (!isTheOrderOwner(account, order)) // 当该订单不属于登录用户时,抛出异常
            throw new UserProcessingOrderException("您只可以取消自己的订单");

        orderService.cancelOrder(order); // 取消订单

        uiModel.addAttribute("order", order);
        return "redirect:/order/{id}";
    }

    @RequestMapping(value = "/confirm/{id}", method = RequestMethod.POST)
    public String confirm(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (!isTheOrderOwner(account, order)) // 当该订单不属于登录用户时,抛出异常
            throw new UserProcessingOrderException("您只可以确认自己的订单");

        orderService.confirmOrder(order); // 确认收货

        uiModel.addAttribute("order", order);
        return "redirect:/order/{id}";
    }

    @RequestMapping(value = "/refund/{id}", method = RequestMethod.POST)
    public String refund(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (!isTheOrderOwner(account, order)) // 当该订单不属于登录用户时,抛出异常
            throw new UserProcessingOrderException("您只可以退自己的订单");

        orderService.refundOrder(order); // 退单

        uiModel.addAttribute("order", order);
        return "redirect:/order/{id}";
    }

    @RequestMapping(value = "/confirmRefund/{id}", method = RequestMethod.POST)
    public String confirmRefund(@PathVariable("id") Integer id, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_BUSINESS); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情
        Integer shopId = order.getShop().getId(); // 获取商店id

        if (!isTheOrderKeeper(account, order)) // 当该订单不属于登录商家时,抛出异常
            throw new BusinessProcessingOrderException("您只可以确认退自己的订单");

        orderService.confirmRefund(order); // 确认退单

        return "redirect:/business/showOrder?shopId=" + shopId + "&orderStatus=" + Order.STATUS_PAID;
    }

    @RequestMapping(value = "/cancelRefund/{id}", method = RequestMethod.POST)
    public String cancelRefund(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session, SESSION_ACCOUNT); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (!isTheOrderOwner(account, order)) // 当该订单不属于登录用户时,抛出异常
            throw new UserProcessingOrderException("您只可以取消自己退的订单");

        orderService.cancelRefundOrder(order); // 取消退单

        uiModel.addAttribute("order", order);
        return "redirect:/order/{id}";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(@Valid Order order, BindingResult bindingResult, HttpSession session, Model uiModel) {

        if (bindingResult.hasErrors()) {

        }

        // 为订单设置商店信息,商家信息
        Shop shop = shopService.findById(order.getShop().getId());
        order.setShop(shop);
        order.setBusinessId(shop.getBusiness().getId());

        orderService.submitOrder(order); // 下单
        carts.clearCart(order.getShop().getId()); // 清空该商店的购物车
        return "redirect:/payment/" + order.getId(); // 跳转到支付页面
    }

    @RequestMapping(value = "/accept/{id}", method = RequestMethod.POST)
    public String accept(@PathVariable("id") Integer id, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_BUSINESS); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情
        Integer shopId = order.getShop().getId(); // 获取商店id

        if (!isTheOrderKeeper(account, order)) // 当该订单不属于登录商家时,抛出异常
            throw new BusinessProcessingOrderException("您只可以接自己的订单");

        orderService.acceptOrder(order); // 接单

        return "redirect:/business/showOrder?shopId=" + shopId + "&orderStatus=" + Order.STATUS_PAID;
    }

    @RequestMapping(value = "/deliver/{id}", method = RequestMethod.POST)
    public String deliver(@PathVariable("id") Integer id, HttpSession session) {
        Account account = getSessionAccount(session, SESSION_BUSINESS); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情
        Integer shopId = order.getShop().getId(); // 获取商店id

        if (!isTheOrderKeeper(account, order)) // 当该订单不属于登录商家时,抛出异常
            throw new BusinessProcessingOrderException("您只可以对自己的订单进行发货");

        orderService.deliverOrder(order); // 发货

        return "redirect:/business/showOrder?shopId=" + shopId + "&orderStatus=" + Order.STATUS_PAID;
    }

    /**
     * 对用户进行订单操作时产生的错误进行处理
     * @param req
     * @param ex
     * @return
     */
    @ExceptionHandler(UserProcessingOrderException.class)
    public ModelAndView handleUserError(HttpServletRequest req, Exception ex) {
        logger.error("Request: " + req.getRequestURL() + " raised " + ex);

        ModelAndView mav = initErrorView(ex, req, "order/error");

        return mav;
    }

    /**
     * 对商家进行订单操作时产生的错误进行处理
     * @param req
     * @param ex
     * @return
     */
    @ExceptionHandler(BusinessProcessingOrderException.class)
    public ModelAndView handleBusinessError(HttpServletRequest req, Exception ex) {
        logger.error("Request: " + req.getRequestURL() + " raised " + ex);

        ModelAndView mav = initErrorView(ex, req, "order/error");

        return mav;
    }

    private ModelAndView initErrorView(Exception ex, HttpServletRequest req, String viewName) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("exception", ex);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName(viewName);

        return mav;
    }

    /**
     * 判断登录用户是否该订单的管理者(商家)
     * @param account 商家用户
     * @param order 订单
     * @return
     */
    private boolean isTheOrderKeeper(Account account, Order order) {
        Business business =
                businessService.findBusinessByAccountId(account.getId()); // 获取登录商家
        return business.getId().equals(order.getBusinessId());
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
     * 获取登录用户
     * @param session
     * @param user
     * @return 返回当前登录用户
     */
    private Account getSessionAccount(HttpSession session, String user) {
        return (Account) session.getAttribute(user);
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
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
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
