package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.hibernate.validator.internal.engine.messageinterpolation.parser.ELState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Controller
@RequestMapping("/manageData")
public class DateAnalysisController {
    @Resource
    private ShopService shopService;
    @Resource
    private OrderService orderService;
    @Resource
    private EvaluationService evaluationService;


    /**
     * 管理员所有订单
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("/getOrders")
    public String getOrders(@RequestParam("type") String type, Model model) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int e = 0;
        List<Order> orderList = null;
               // orderService.findAllOrders();
        Order oList = new Order();
        if(orderList!=null) {
            for (Order order : orderList) {
                if (0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 10.0) {
                    a = a + 1;
                }
                if (10.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) < 20.0) {
                    b = b + 1;
                }
                if (20.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 30.0) {
                    c = c + 1;
                }
                if (40.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 50.0) {
                    d = d + 1;
                }
                if (50.0 < Double.parseDouble(order.getTotal().toString())) {
                    e = e + 1;
                }
                oList = order;
            }
        }
        model.addAttribute("morder", oList);
        model.addAttribute("a", a);
        model.addAttribute("b", b);
        model.addAttribute("c", c);
        model.addAttribute("d", d);
        model.addAttribute("e", e);
        int i = Integer.parseInt(type);
        if (i == 1) {
            return "system/dataorder/cyliorders";
        }
        if (i == 2) {
            return "system/dataorder/fanorders";
        }
        if (i == 3) {
            return "system/dataorder/lineorders";
        } else
            return null;
    }


    /**
     * 管理员获取某个时间段的所有订单
     * @param type
     * @param model
     * @param begin
     * @param end
     * @return
     */
    @RequestMapping("/getOrdersByTime")
    public String getOrdersByTime( String type, Model model,
                            @RequestParam("begin") Date begin, @RequestParam("end")Date end) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int e = 0;
        List<Order> orderList = orderService.findOrdersBetween(begin, end);
        Order oList = new Order();
        for (Order order : orderList) {
            if (0 < Double.parseDouble(order.getTotal().toString()) &&
                    Double.parseDouble(order.getTotal().toString()) <= 10.0) {
                a = a + 1;
            }
            if (10.0 < Double.parseDouble(order.getTotal().toString()) &&
                    Double.parseDouble(order.getTotal().toString()) < 20.0) {
                b = b + 1;
            }
            if (20.0 < Double.parseDouble(order.getTotal().toString()) &&
                    Double.parseDouble(order.getTotal().toString()) <= 30.0) {
                c = c + 1;
            }
            if (40.0 < Double.parseDouble(order.getTotal().toString()) &&
                    Double.parseDouble(order.getTotal().toString()) <= 50.0) {
                d = d + 1;
            }
            if (50.0 < Double.parseDouble(order.getTotal().toString())) {
                e = e + 1;
            }
            oList = order;
        }
        model.addAttribute("morder", oList);
        model.addAttribute("a", a);
        model.addAttribute("b", b);
        model.addAttribute("c", c);
        model.addAttribute("d", d);
        model.addAttribute("e", e);
        int i = Integer.parseInt(type);
        if (i == 1) {
            return "system/dataorder/cyliorders";
        }
        if (i == 2) {
            return "system/dataorder/fanorders";
        }
        if (i == 3) {
            return "system/dataorder/lineorders";
        } else
            return null;
    }



    /**
     * 管理员获得商家评分
     * @param model
     * @param type
     * @return
     */
    @RequestMapping("/getShops")
    public String getShops(Model model, @RequestParam("type") String type) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int e = 0;
        double eva = 0.0;
        List<Shop> shopList = shopService.findAll();
        for (Shop shop : shopList) {
            String shopname = shop.getShopName();
            List<OrderEvaluation> evaluationList = evaluationService.findByShopName(shopname);
            if (evaluationList != null){
                for (OrderEvaluation evaluation : evaluationList) {
                    double avg = 0.0;
                    for (int i = 0; i < evaluationList.size(); i++) {
                        avg = eva + evaluation.getScore();
                    }
                    eva = avg / evaluationList.size();
                    if (0.0 < eva && eva <= 1.0) {
                        a = a + 1;
                    }
                    if (1.0 < eva && eva <= 2.0) {
                        b = b + 1;
                    }
                    if (2.0 < eva && eva <= 3.0) {
                        c = c + 1;
                    }
                    if (3.0 < eva && eva <= 4.0) {
                        d = d + 1;
                    }
                    if (4.0 < eva) {
                        e = e + 1;
                    }
                }
        }
        }
        model.addAttribute("mshop", shopList);
        model.addAttribute("a", a);
        model.addAttribute("b", b);
        model.addAttribute("c", c);
        model.addAttribute("d", d);
        model.addAttribute("e", e);
        int i = Integer.parseInt(type);
        if (i == 1) {
            return "system/datashop/cyliorders";
        }
        if (i == 2) {
            return "system/datashop/fanorders";
        }
        if (i == 3) {
            return "system/datashop/lineorders";
        } else
            return null;
    }
}
