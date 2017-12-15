package com.cat.rufull.app.controller.pay;

import com.cat.rufull.domain.common.util.PaymentUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/pay")
public class payController{

    //跳转到支付页面
    @RequestMapping("toPay")
    public String toPay(){
        return "pay/payOrder";
    }


    @RequestMapping("/payOrder")
    public void payOrder (String pd_FrpId, HttpServletResponse response) throws Exception{


        // 付款:
        // 定义付款的参数:
        String p0_Cmd = "Buy";
        String p1_MerId = "10001126856";
        String p2_Order = "";
        String p3_Amt = "0.01";
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        String p8_Url = "http://172.16.13.209:80/rufull/pay/payBack";
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,pd_FrpId , pr_NeedResponse, keyValue);

        StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
        sb.append("p0_Cmd=").append(p0_Cmd).append("&");
        sb.append("p1_MerId=").append(p1_MerId).append("&");
        sb.append("p2_Order=").append(p2_Order).append("&");
        sb.append("p3_Amt=").append(p3_Amt).append("&");
        sb.append("p4_Cur=").append(p4_Cur).append("&");
        sb.append("p5_Pid=").append(p5_Pid).append("&");
        sb.append("p6_Pcat=").append(p6_Pcat).append("&");
        sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
        sb.append("p8_Url=").append(p8_Url).append("&");
        sb.append("p9_SAF=").append(p9_SAF).append("&");
        sb.append("pa_MP=").append(pa_MP).append("&");
        sb.append("pd_FrpId=").append(pd_FrpId).append("&");
        sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
        sb.append("hmac=").append(hmac);

        response.sendRedirect(sb.toString());

    }

    /**
     * 付款成功后的回调方法
     */
    @RequestMapping("payBack")
    public String callBack(Model model, Integer r1_Code, String r6_Order, double r3_Amt){

        if(r1_Code == 1){
            model.addAttribute("payResult", "支付成功！");
        }else {
            model.addAttribute("payResult", "支付失败");
        }
        model.addAttribute("orderMsg","您的订单号为："+r6_Order+"，付款金额："+r3_Amt+"");
        return "pay/msg";
    }
}
