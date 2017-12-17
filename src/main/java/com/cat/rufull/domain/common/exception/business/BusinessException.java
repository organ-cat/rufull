package com.cat.rufull.domain.common.exception.business;

public class BusinessException extends RuntimeException{
    public BusinessException(Object obj) {
        super(obj.toString());
    }
}
