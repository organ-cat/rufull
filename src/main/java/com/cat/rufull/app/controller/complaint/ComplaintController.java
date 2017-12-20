package com.cat.rufull.app.controller.complaint;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Complaint;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.ComplaintService;
import com.cat.rufull.domain.service.shop.ShopService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/complaint")
public class ComplaintController {
    @Autowired
    private ComplaintService complaintService;
    @Autowired
    private ShopService shopService;

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public ModelAndView complaintPage(@RequestParam("shopId") int shopId) {
        Shop shop = shopService.findById(shopId);
        ModelAndView view = new ModelAndView();
        view.addObject("shop", shop);
        view.setViewName("account/complaint");
        return view;
    }

    @RequestMapping(value = "/addComplaint", method = RequestMethod.POST)
    public String addComplaint(@RequestParam("accountId") int accountId,
                               @RequestParam("shopId") int shopId,
                               @RequestParam("type") int type,
                               @RequestParam("evidence") MultipartFile evidence,
                               @RequestParam("content") String content,
                               HttpServletRequest request, HttpServletResponse response) {
        System.out.println("投诉参数——"+accountId +"|"+ shopId +"|"+ type +"|"+ content);
        String fileName = null;
        if (evidence != null){
            String path = request.getServletContext().getRealPath("upload/complaint");
            fileName = UUID.randomUUID().toString().replaceAll("-", "")
                    + evidence.getOriginalFilename();
            try {
                FileUtils.copyInputStreamToFile(evidence.getInputStream(), new File(path, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Shop shop = new Shop();
        shop.setId(shopId);
        Account account = new Account();
        account.setId(accountId);
        complaintService.addComplaint(
                new Complaint(type, content, fileName, new Date(), Complaint.COMPLAINTED, account, shop));
        return "redirect:/complaint/showAccount?id=" + accountId;
    }

    @RequestMapping(value = "/showAccount", method = RequestMethod.GET)
    public ModelAndView getComplaintByAccount(@RequestParam("id") int id,
                                              @RequestParam("currentPage") int currentPage) {
        PageInfo<Complaint> pageInfo = selectComplaintByAccount(id, currentPage);
        for (Complaint complaint : pageInfo.getList()) {
            System.out.println(complaint.toString());
        }
        ModelAndView view = new ModelAndView();
        view.setViewName("account/comlpaintList");
        view.addObject("complaintList", pageInfo.getList());
        view.addObject("nextPage", pageInfo.getNextPage());
        view.addObject("prePage", pageInfo.getPrePage());
        view.addObject("pages", pageInfo.getPages());
        return view;
    }
    public PageInfo<Complaint> selectComplaintByAccount(int accountId, int currentPage) {
        PageHelper.startPage(currentPage, 1);
        List<Complaint> list = complaintService.findAccountComplaintListById(accountId);
        PageInfo<Complaint> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
    @RequestMapping(value = "/getComplaintByShop", method = RequestMethod.GET)
    public ModelAndView getComplaintByShop(@RequestParam("shopId") int shopId) {
        List<Complaint> list = complaintService.findShopComplaintListById(shopId);
        ModelAndView view = new ModelAndView();
        view.setViewName("");
        view.addObject("complaintList", list);
        return view;
    }


    /**
     * 返回页面的json信息
     * @param response HttpServletResponse
     * @param result   返回json的结果
     */
    public void returnMessage(HttpServletResponse response, String result) {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
