package com.cat.rufull.app.controller.account;

import com.cat.rufull.domain.common.util.EncryptByMD5;
import com.cat.rufull.domain.common.util.ReturnCode;
import com.cat.rufull.domain.common.util.RufullCookie;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Footprint;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.account.FootprintService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private FootprintService footprintService;
    @Autowired
    private ShopService shopService;

    /**
     * 忘记密码,验证身份后设置新密码
     * @param username
     * @param session
     * @param response
     */
    @RequestMapping(value = "/setUsername",method = RequestMethod.POST)
    public void setUsername(@RequestParam("username") String username,
                            HttpSession session, HttpServletResponse response) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        account.setUsername(username);
        Account accountByUsername = accountService.findAccountByUsername(username, Account.ACCOUNT_ROLE);

        if (accountByUsername == null) {
            accountService.setUsername(account.getId(), username);
            account.setUsername(username);
            session.setAttribute(Account.ACCOUNT_SESSION, account);
            returnMessage(response, "11111111111111");
        } else {
            returnMessage(response, "00000000000000");
        }

    }

    /**
     * 用户更改昵称
     * @param nickname
     * @param session
     * @param response
     */
    @RequestMapping(value = "/updateNickname",method = RequestMethod.POST)
    public void updateNickname(@RequestParam("nickname") String nickname,
                               HttpSession session, HttpServletResponse response) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        accountService.updateNickname(account.getId(), nickname);
        account.setNickname(nickname);
        session.setAttribute(Account.ACCOUNT_SESSION, account);
        returnMessage(response, "111111111111");
    }

    /**
     * 修改绑定手机的页面
     * @return 修改绑定手机的页面
     */
    @RequestMapping(value = "/bindPhonePage",method = RequestMethod.GET)
    public String bindPhonePage(){
        return "account/bindPhone";
    }

    /**
     * 修改绑定手机的页面，修改绑定的手机
     * @param phone         用户输入的手机
     * @param checkCode     用户输入的验证码
     * @param session
     * @param response
     */
    @RequestMapping(value = "/bindPhone", method = RequestMethod.POST)
    public void bindPhone(@RequestParam("phone") String phone, @RequestParam("checkCode") String checkCode,
                          HttpSession session, HttpServletResponse response) {
        //第一次验证码
        String phoneSeesion = (String) session.getAttribute(Account.PHONE_CHECK_CODE);
        //第二次验证码
        String newCheckCode = (String) session.getAttribute(Account.NEW_PHONE_CHECK_CODE);
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        //第一次手机身份验证
        if (phoneSeesion != null && newCheckCode == null) {
            if (phoneSeesion.equals(checkCode)) {
                if (phone.equals(account.getPhone())) {
                    returnMessage(response, ReturnCode.PHONE_CHECK_CODE_RIGHT);
                    session.removeAttribute(Account.PHONE_CHECK_CODE);
                } else {
                    returnMessage(response, ReturnCode.PHONE_CHECK_CODE_RIGHT);
                    returnMessage(response, ReturnCode.PHONE_ERROR);
                }
            } else {
                returnMessage(response, ReturnCode.PHONE_CHECK_CODE_ERROR);
            }
        }
        //第二次手机身份验证
        if (phoneSeesion == null && newCheckCode != null) {
            if (newCheckCode.equals(checkCode)) {
                account.setPhone(phone);
                accountService.bindPhone(account);
                session.removeAttribute(Account.NEW_PHONE_CHECK_CODE);
                returnMessage(response, ReturnCode.NEW_PHONE_CHECK_CODE_RIGHT);
            } else {
                returnMessage(response, ReturnCode.NEW_PHONE_CHECK_CODE_ERROR);
            }
        }
    }
    //绑定邮箱号，完成
    @RequestMapping(value = "/bindEmailPage",method = RequestMethod.GET)
    public String bindEmailPage(){
        return "account/bindEmail";
    }
    /**
     * 修改绑定邮箱的页面，修改绑定的手机
     * @param email         用户输入的邮箱
     * @param checkCode     用户输入的验证码
     * @param session
     * @param response
     */
    @RequestMapping(value = "/bindEmail", method = RequestMethod.POST)
    public void bindEmail(@RequestParam("email") String email, @RequestParam("checkCode") String checkCode,
                          HttpSession session, HttpServletResponse response) {
        //第一次验证码
        String emailSeesion = (String) session.getAttribute(Account.EMAIL_CHECK_CODE);
        //第二次验证码
        String newCheckCode = (String) session.getAttribute(Account.NEW_EMAIL_CHECK_CODE);
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        //第一次手机身份验证
        if (emailSeesion != null && newCheckCode == null) {
            if (emailSeesion.equals(checkCode)) {
                if (email.equals(account.getEmail())) {
                    returnMessage(response, ReturnCode.EMAIL_CHECK_CODE_RIGHT);
                    session.removeAttribute(Account.EMAIL_CHECK_CODE);
                } else {
                    returnMessage(response, ReturnCode.EMAIL_ERROR);
                }
            } else {
                returnMessage(response, ReturnCode.EMAIL_CHECK_CODE_ERROR);
            }
        }
        //第二次手机身份验证
        if (emailSeesion == null && newCheckCode != null) {
            if (newCheckCode.equals(checkCode)) {
                account.setEmail(email);
                accountService.bindEmail(account);
                session.removeAttribute(Account.NEW_EMAIL_CHECK_CODE);
                returnMessage(response, ReturnCode.NEW_EMAIL_CHECK_CODE_RIGHT);
            } else {
                returnMessage(response, ReturnCode.NEW_EMAIL_CHECK_CODE_ERROR);
            }
        }

    }
    @RequestMapping(value = "addEmailPage",method = RequestMethod.GET)
    public String addEmailPage() {
        return "account/addEmail";
    }
    @RequestMapping(value = "addPhonePage",method = RequestMethod.GET)
    public String addPhonePage() {
        return "account/addPhone";
    }
    /**
     * 用户添加邮箱
     * @param email         用户输入的邮箱
     * @param checkCode     用户输入的验证码
     * @param session
     * @param response
     */
    @RequestMapping(value = "addEmail",method = RequestMethod.POST)
    public void addEmail(@RequestParam("email") String email, @RequestParam("checkCode") String checkCode,
                           HttpSession session, HttpServletResponse response) {
        String code = (String) session.getAttribute(Account.EMAIL_CHECK_CODE);
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        System.out.println("code" + code);
        System.out.println("addPhone——" + email + "—|—" + checkCode);
        if (code != null) {
            if (code.equals(checkCode)) {
                Account user = accountService.findAccountByEmail(email, Account.ACCOUNT_ROLE);
                if (user == null) {
                    account.setEmail(email);
                    accountService.bindEmail(account);
                    session.removeAttribute(Account.EMAIL_CHECK_CODE);
                    returnMessage(response, ReturnCode.EMAIL_PASSED);
                    System.out.println("成功");
                } else {
                    System.out.println("邮箱已经存在了");
                    returnMessage(response, ReturnCode.EMAIL_REGISTERED);
                }
            } else {
                System.out.println("验证码错误");
                returnMessage(response, ReturnCode.EMAIL_CHECK_CODE_ERROR);
            }
        } else {
            System.out.println("请重新获取验证码！");
        }

    }
    /**
     * 用户添加手机
     * @param phone         用户输入的手机
     * @param checkCode     用户输入的验证码
     * @param session
     * @param response
     */
    @RequestMapping(value = "addPhone",method = RequestMethod.POST)
    public void addPhone(@RequestParam("phone") String phone, @RequestParam("checkCode") String checkCode,
                         HttpSession session, HttpServletResponse response) {
        String code = (String) session.getAttribute(Account.PHONE_CHECK_CODE);
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        System.out.println("addPhone——" + phone + "—|—" + checkCode);
        if (code.equals(checkCode)) {
            Account user = accountService.findAccountByPhone(phone, Account.ACCOUNT_ROLE);
            if (user == null) {
                account.setPhone(phone);
                accountService.bindPhone(account);
                session.removeAttribute(Account.PHONE_CHECK_CODE);
                returnMessage(response, ReturnCode.PHONE_PASSED);
                System.out.println("成功");
            } else {
                System.out.println("手机已经存在了");
                returnMessage(response, ReturnCode.PHONE_REGISTERED);
            }
        } else {
            System.out.println("验证码错误");
            returnMessage(response, ReturnCode.PHONE_CHECK_CODE_ERROR);
        }

    }

    /**
     * 根据用户id跳转到用户的个人中心页面
     * @param id    用户的id
     * @return  个人中心页面
     */
    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public ModelAndView center(@RequestParam("id") int id) {
        //获取用户足迹集合
        List<Footprint> footprintList = footprintService.findFootprintList(id);
        //用户浏览过的商店集合
        List<Shop> shopList = new ArrayList<>();
        ModelAndView view = new ModelAndView();
        for (Footprint footprint : footprintList) {
            shopList.add(shopService.findById(footprint.getShopId()));
        }
        view.addObject(Footprint.FOOTPRINT_LIST, shopList);
        view.setViewName("account/center");
        return view;
    }

    /**
     * @return 个人资料页面
     */
    @RequestMapping(value = "/infomation", method = RequestMethod.GET)
    public String infomation() {
        return "account/infomation";
    }
    /**
     * @return 更改密码页面
     */
    @RequestMapping(value = "/updatePasswordPage", method = RequestMethod.GET)
    public String updatePasswordPage() {
        return "account/updatePassword";
    }

    /**
     * 用户更改密码
     * @param id                用户的id
     * @param newPassword      用户的新密码
     * @param oldPassword      用户的旧密码
     * @param response
     */
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public void updatePassword(@RequestParam("id") int id, @RequestParam("newPassword") String newPassword,
                               @RequestParam("oldPassword") String oldPassword, HttpServletResponse response) {
        boolean isSuccess = accountService.updatePassword(id, EncryptByMD5.encrypt(newPassword), EncryptByMD5.encrypt(oldPassword));
        if (isSuccess) {
            returnMessage(response, ReturnCode.UPDATE_PASSWORD_SUCCESS);
        } else {
            returnMessage(response, ReturnCode.UPDATE_PASSWORD_FAIL);
        }
    }

    /**
     * 安全中心页面
     * @return
     */
    @RequestMapping(value = "/security", method = RequestMethod.GET)
    public String security() {
        return "account/security";
    }

    /**
     * 上传头像页面
     * @return  上传头像页面
     */
    @RequestMapping("uploadPage")
    public String upload(){
        return "account/upload";
    }

    /**
     * 上传头像
     * @param photo         用户上传的头像的名称
     * @param id            用户的id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/upload")
    public String uploadPhoto(@RequestParam("photo") MultipartFile photo, @RequestParam("id") int id,
                              HttpServletRequest request, HttpSession session) {
        Account account = (Account) session.getAttribute(Account.ACCOUNT_SESSION);
        String path = request.getServletContext().getRealPath("upload/account");
        String fileName = "A" + id + photo.getOriginalFilename();
        System.out.println("fileName——"+fileName);
        if (!fileName.equalsIgnoreCase("A" + id)) {
            account.setPhoto(fileName);
            try {
                FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(path, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        accountService.updateAccountPhoto(id, fileName);
        session.setAttribute(Account.ACCOUNT_SESSION, account);
        return "account/infomation";
    }

    /**
     * 用户删除足迹，即浏览过的商家
     * @param accountId     用户的id
     * @param shopId        商店的id
     * @return
     */
    @RequestMapping(value = "/deleteFootprint",method = RequestMethod.GET)
    public ModelAndView deleteFootprint(@RequestParam("accountId") int accountId,
                                        @RequestParam("shopId") int shopId) {
        //根据用户id和商店id删除足迹,返回删除后的集合
        List<Footprint> footprints = footprintService.deleteFootprint(accountId, shopId);
        ModelAndView view = new ModelAndView();
        List<Shop> shopList = new ArrayList<>();
        for (Footprint footprint : footprints) {
            shopList.add(shopService.findById(footprint.getShopId()));
        }
        view.setViewName("account/center");
        view.addObject(Footprint.FOOTPRINT_LIST, shopList);
        return view;
    }
    /**
     * 退出的功能
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        //获取用户的cookie
        Cookie[] cookies = request.getCookies();
        if (null != cookies){
            for (Cookie cookie : cookies) {
                //判断是否存在rufullCookie，即本网站的cookie
                if (cookie.getName().equals(RufullCookie.RUFULLCOOKIE)) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);// 立即销毁cookie
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    break;
                }
            }
        }
        session.removeAttribute("shop");
        session.invalidate();
        return "index";
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
