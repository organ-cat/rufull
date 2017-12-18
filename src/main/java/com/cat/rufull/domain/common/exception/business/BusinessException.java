package com.cat.rufull.domain.common.exception.business;

public class BusinessException extends RuntimeException{
    public BusinessException() {

    }

    public BusinessException(String message) {
        super(message);
    }
}
