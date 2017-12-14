package com.cat.rufull.app.controller.evaluation;

import com.cat.rufull.app.controller.payment.PaymentController;
import com.cat.rufull.domain.model.*;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {
    private static Logger logger = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private OrderService orderService;
    @Autowired
    private EvaluationService evaluationService;
    @Autowired
    private MessageSource messageSource;
    @Autowired
    private ShopService shopService;
    private static final String SESSION_ACCOUNT = "account";



    @RequestMapping("/add_eval")
    public String add_eval(@ModelAttribute("orderEvaluation") OrderEvaluation orderEvaluation){
        //System.out.println(orderEvaluation);
        //evaluationService.addEvaluation();
        return "order/show";
    }

    @RequestMapping("/findOrderEvaluation")
    public String findOrderEvaluation(Integer id, Model model) throws Exception {
        List<OrderEvaluation> orderEvaluation = evaluationService.findOrderEvaluation(id);
        model.addAttribute("orderEvaluation", orderEvaluation);
        return "evaluation/evaluation";
    }

    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String createForm(@PathVariable("id") Integer id, HttpSession session, Model uiModel) {
        Account account = getSessionAccount(session); // 获取当前登录用户
        Order order = orderService.findOrderById(id); // 获取订单详情

        if (isTheOrderOwner(account, order)) { // 当该订单属于登录用户时,才可以跳转到订单评价页面

            // 对订单评价进行初始化
            OrderEvaluation orderEvaluation = new OrderEvaluation();
            orderEvaluation.setOrder(order);
            orderEvaluation.setShopId(order.getShop().getId());

            // 对订单评价下的订单项评价列表进行初始化
            List<ProductEvaluation> productEvaluations = new ArrayList<ProductEvaluation>();
            for (LineItem item: order.getLineItems()) {
                ProductEvaluation productEvaluation = new ProductEvaluation();
                productEvaluation.setItem(item);
                productEvaluations.add(productEvaluation);
            }

            orderEvaluation.setProductEvaluations(productEvaluations);

            uiModel.addAttribute("order", order);
            uiModel.addAttribute("orderEvaluation", orderEvaluation);
            uiModel.addAttribute("productEvaluations", productEvaluations);
            return "evaluation/edit";
        } else {
            uiModel.addAttribute("error", "您只可以评价自己的订单");
            return "evaluation/error";
        }
    }

    @RequestMapping(method = RequestMethod.POST)
    public String create(OrderEvaluation orderEvaluation, BindingResult bindingResult, Model uiModel) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("message", "出错了");
            return "evaluation/error";
        }
        logger.info(orderEvaluation.toString());
//        OrderEvaluationService.save(contact);
        return "redirect:/order";
    }

    /**
     * 判断登录用户是否为该订单的所有者(用户)
     *
     * @param account 用户
     * @param order   订单
     * @return
     */
    private boolean isTheOrderOwner(Account account, Order order) {
        return account.getId().equals(order.getAccountId());
    }



    /**
     * 获取登录用户
     *
     * @param session
     * @return 返回当前登录用户
     */
    private Account getSessionAccount(HttpSession session) {
        return (Account) session.getAttribute(SESSION_ACCOUNT);
    }
}
