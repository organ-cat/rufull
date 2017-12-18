package com.cat.rufull.domain.service.payment;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.Shop;
import com.cat.rufull.domain.service.account.AccountService;
import com.cat.rufull.domain.service.order.OrderService;
import com.cat.rufull.domain.service.shop.ShopService;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;

public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private OrderService orderService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private ShopService shopService;

    @Override
    public void reFund(Integer orderId) throws Exception {
        Order order = orderService.findOrderById(orderId); //获取订单详情

        int shopId = order.getShop().getId();
        int accountId = order.getAccountId();
        BigDecimal money = order.getTotal();

        Account account = accountService.findAccountById(accountId);//获取用户信息
        Shop shop = shopService.findById(shopId);//获取商店信息




    }
}
