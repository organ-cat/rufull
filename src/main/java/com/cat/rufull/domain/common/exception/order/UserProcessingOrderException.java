package com.cat.rufull.domain.common.exception.order;

/**
 * 用户处理订单时出现的异常
 */
public class UserProcessingOrderException extends RuntimeException {

    public UserProcessingOrderException() {
    }

    public UserProcessingOrderException(String message) {
        super(message);
    }

    public UserProcessingOrderException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserProcessingOrderException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
