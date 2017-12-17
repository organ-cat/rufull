package com.cat.rufull.app.controller.address;

import com.cat.rufull.domain.model.Address;
import com.cat.rufull.domain.service.account.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @RequestMapping("/addressManage")
    public ModelAndView registerPage(@RequestParam("id") int accountId) {
        return returnView(accountId);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addAddress(@RequestParam("accountId") int accountId, @RequestParam("receiver") String receiver,
                                   @RequestParam("phone") String phone, @RequestParam("location") String location,
                                   @RequestParam("detail") String detail, @RequestParam("status") int status) {
        Address address = new Address(null, receiver, phone, location, detail, status, accountId);
        addressService.addAddress(address);
        return returnView(accountId);
    }
    @RequestMapping(value = "/delete")
    public ModelAndView deleteAddress(@RequestParam("id") int id, @RequestParam("accountId") int accountId) {
        addressService.deleteAddressById(id);
        return returnView(accountId);
    }


    @RequestMapping(value = "/findAddressById", method = RequestMethod.GET)
    public @ResponseBody
    Address findAddressById(@RequestParam("id") int id) {
        return addressService.findAddressById(id);
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateAddress(@RequestParam("id") int id,@RequestParam("accountId") int accountId,
                                      @RequestParam("receiver") String receiver, @RequestParam("phone") String phone,
                                      @RequestParam("location") String location, @RequestParam("detail") String detail,
                                      @RequestParam("status") int status){
        System.out.println(id + "+" + accountId + "+" + receiver + "+" + phone + "+" + location + "+" + detail + "+" + status);
        addressService.updateAddress(new Address(id, receiver, phone, location, detail, status, accountId));
        return returnView(accountId);
    }

    public ModelAndView returnView(int accountId) {
        List<Address> addresses = addressService.queryAddressList(accountId);
        ModelAndView view = new ModelAndView();
        view.setViewName("account/address");
        view.addObject(Address.ADDRESS_REQUEST, addresses);
        return view;
    }
}

