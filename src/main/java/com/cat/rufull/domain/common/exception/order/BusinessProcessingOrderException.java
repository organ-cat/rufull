package com.cat.rufull.domain.common.exception.order;

/**
 * 商家处理订单时出现的异常
 */
public class BusinessProcessingOrderException extends RuntimeException {

    public BusinessProcessingOrderException() {
    }

    public BusinessProcessingOrderException(String message) {
        super(message);
    }

    public BusinessProcessingOrderException(String message, Throwable cause) {
        super(message, cause);
    }

    public BusinessProcessingOrderException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
