package com.cat.rufull.app.controller.serviceCenter;

import com.cat.rufull.domain.common.util.FileUtils;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.service.order.OrderService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.codehaus.jackson.annotate.JsonTypeInfo;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.KeyDeserializer;
import org.codehaus.jackson.map.Serializers;
import org.mybatis.generator.config.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.security.provider.MD2;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/12/8.
 */
@Controller
@RequestMapping("/creatBill")
public class ServiceCenterController {
    @Resource
    private OrderService orderService;

    /**
     * 根据时间段获得用户的订单数据
     * @param beginTime
     * @param endTime
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getAccountOrdersBetween")
    public String getAccountOrdersBetween(Date beginTime, Date endTime,
                                          Model model,HttpSession session){
        session.removeAttribute("exportXls");
        Account account = (Account) session.getAttribute("account");
        List<Order> list = null;
                //orderService.findAccountOrdersBetween(account.getId(),beginTime,endTime);
        model.addAttribute("getAccountOrdersBetween",list);
        session.setAttribute("exportXls",list);
        return "service/exportOrdersXls";
    }


    /**
     * 账单下载
     * @param session
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/exportXls")
    public String exportXls(HttpSession session, HttpServletRequest request,
                            HttpServletResponse response) throws IOException {
        Account account = (Account) session.getAttribute("account");
        List<Order> list = (List<Order>) session.getAttribute("exportXls");
        // 在内存中创建一个Excel文件，通过输出流写到客户端提供下载
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建一个sheet页
        HSSFSheet sheet = workbook.createSheet(account.getUsername()+"用户的账单数据");
        // 创建标题行
        HSSFRow headRow = sheet.createRow(0);
        headRow.createCell(0).setCellValue("账单编号");
        headRow.createCell(1).setCellValue("用户姓名");
        headRow.createCell(2).setCellValue("用户手机号");
        headRow.createCell(3).setCellValue("收货地址");
        headRow.createCell(4).setCellValue("支付方式");
        headRow.createCell(5).setCellValue("商店名称");
        headRow.createCell(6).setCellValue("商店地址");
        headRow.createCell(7).setCellValue("消费金额");
        headRow.createCell(8).setCellValue("完成时间");

        for (Order order: list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(order.getId());
            dataRow.createCell(1).setCellValue(account.getUsername());
            dataRow.createCell(2).setCellValue(order.getAddress().getPhone());
            dataRow.createCell(3).setCellValue(order.getAddress().getLocation()+order.getAddress().getDetail());
            if(order.getPaymentMethod().toString().equals("ONLINE"))
            {
                dataRow.createCell(4).setCellValue("在线支付");
            }
            else if(order.getPaymentMethod().toString().equals("OFFLINE"))
            {
                dataRow.createCell(4).setCellValue("货到付款");
            }

            dataRow.createCell(5).setCellValue(order.getShop().getShopName());
            dataRow.createCell(6).setCellValue(order.getShop().getAddress());
            dataRow.createCell(7).setCellValue(order.getTotal().toString());
            dataRow.createCell(8).setCellValue(order.getCompletedTime());
        }

        String filename = "用户的账单数据.xls";
        String agent = request.getHeader("User-Agent");
        filename = FileUtils.encodeDownloadFilename(filename, agent);
        //一个流两个头
        ServletOutputStream out = response.getOutputStream();
        //自动判断下载的文件类型
        response.setContentType("multipart/form-data");
        response.setHeader("content-disposition", "attchment;filename="+filename);
        workbook.write(out);
        return null;
    }


    /**
     * 用户订单的扇形分析
     * @param beginTime
     * @param endTime
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("fanAnalysis")
    public String fanAnalysis(String type,Date beginTime, Date endTime,
                              Model model,HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        List<Order> list = null;
               // orderService.findAccountOrdersBetween(account.getId(), beginTime, endTime);

        int aa = 0;
        int bb = 0;
        int cc = 0;
        int dd = 0;
        int ee = 0;
        if(list!=null) {
            for (Order order : list) {
                if (0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 10.0) {
                    aa = aa + 1;
                }
                if (10.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) < 20.0) {
                    bb = bb + 1;
                }
                if (20.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 30.0) {
                    cc = cc + 1;
                }
                if (40.0 < Double.parseDouble(order.getTotal().toString()) &&
                        Double.parseDouble(order.getTotal().toString()) <= 50.0) {
                    dd = dd + 1;
                }
                if (50.0 < Double.parseDouble(order.getTotal().toString())) {
                    ee = ee + 1;
                }
            }
        }
        int i = Integer.parseInt(type);
        model.addAttribute("AccOlist", list);
        model.addAttribute("aa", aa);
        model.addAttribute("bb", bb);
        model.addAttribute("cc", cc);
        model.addAttribute("dd", dd);
        model.addAttribute("ee", ee);
        if(i==0)
        {
            return "service/fanorders";
        }
        else
            return "service/cyliorders";
    }


}
