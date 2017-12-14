package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.model.Complaint;
import com.cat.rufull.domain.service.account.ComplaintService;
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

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public ModelAndView complaintPage(@RequestParam("shopId") String shopId) {
        ModelAndView view = new ModelAndView();
        view.addObject("shopId", shopId);
        view.setViewName("account/complaintPage");
        return null;
    }

    @RequestMapping(value = "/addComplaint", method = RequestMethod.POST)
    public void addComplaint(@RequestParam("accountId") int accountId,
                             @RequestParam("shopId") int shopId,
                             @RequestParam("type") int type,
                             @RequestParam("evidence") MultipartFile evidence,
                             @RequestParam("content") String content,
                             HttpServletRequest request, HttpServletResponse response) {
        String path = request.getServletContext().getRealPath("upload/comlaint");
        String fileName = UUID.randomUUID().toString().replaceAll("-", "")
                + evidence.getOriginalFilename();
        try {
            FileUtils.copyInputStreamToFile(evidence.getInputStream(), new File(path, fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        Complaint complaint = new Complaint();
        complaint.setType(type);
        complaint.setContent(content);
        complaint.setEvindence(fileName);
        complaint.setStatus(Complaint.COMPLAINTED);
        complaint.setCreatedTime(new Date());
        complaintService.addComplaint(complaint);
        returnMessage(response, "1");

    }

    @RequestMapping(value = "/getComplaintByShop", method = RequestMethod.GET)
    public ModelAndView getComplaintByAccount(@RequestParam("accountId") int accountId) {
        List<Complaint> list = complaintService.findAccountComplaintListById(accountId);
        ModelAndView view = new ModelAndView();
        view.setViewName("");
        view.addObject("complaintList", list);
        return view;
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
