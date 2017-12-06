package com.cat.rufull.app.controller.system;

import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Controller
@RequestMapping("manageData")
public class DateAnalysisController {
    @Resource
    private ShopService shopService;
    @Resource
    private OrderService orderService;
    @Resource
    private EvaluationService evaluationService;
    @RequestMapping("/getOrders")
    public String getOrders(String type, Model model, Date begin,Date end) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int e = 0;
        List<Order> orderList = orderService.findOrdersBetween(begin,end);
        Order orderlist = new Order();
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
            orderlist = order;
        }
        model.addAttribute("morder",orderlist);
        model.addAttribute("a",a);
        model.addAttribute("b",b);
        model.addAttribute("c",c);
        model.addAttribute("d",d);
        model.addAttribute("e",e);
        int i = Integer.parseInt(type);
        if(i == 0) {
            return "system/dataorder/cyliorders";
        }
        if(i == 1) {
            return "system/dataorder/fanorders";
        }
        if(i == 2) {
            return "system/dataorder/lineorders";
        }
        else
            return null;
    }

    @RequestMapping("/getShop")
    public String getShop(Model model,String type){
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;
        int e = 0;
        double eva = 0.0;
        List<Shop> shopList = shopService.findAll();
        for (Shop shop : shopList)
        {
            String name = shop.getShopName();
            List<OrderEvaluation> evaluationList = evaluationService.findByName(name);
            for (OrderEvaluation evaluation : evaluationList)
            {
                double avg =0.0;
                for(int i=0;i<evaluationList.size();i++)
                {
                    avg = eva + evaluation.getScore();
                }
                eva = avg/evaluationList.size();
                if(0.0<eva&&eva<=1.0)
                {
                    a = a+1;
                }
                if(1.0<eva&&eva<=2.0)
                {
                    b = b+1;
                }
                if(2.0<eva&&eva<=3.0)
                {
                    c = c+1;
                }
                if(3.0<eva&&eva<=4.0)
                {
                    d = d+1;
                }
                if(4.0<eva)
                {
                    e = e+1;
                }
            }

        }
        model.addAttribute("mshop",shopList);
        model.addAttribute("a",a);
        model.addAttribute("b",b);
        model.addAttribute("c",c);
        model.addAttribute("d",d);
        model.addAttribute("e",e);
        int i = Integer.parseInt(type);
        if(i == 0) {
            return "system/datashop/cyliorders";
        }
        if(i == 1) {
            return "system/datashop/fanorders";
        }
        if(i == 2) {
            return "system/datashop/lineorders";
        }
        else
            return null;
    }
}
