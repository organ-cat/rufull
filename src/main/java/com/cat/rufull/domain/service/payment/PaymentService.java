package com.cat.rufull.domain.service.payment;

public interface PaymentService {
    //退款:
    public void reFund(Integer orderId) throws Exception;
}
