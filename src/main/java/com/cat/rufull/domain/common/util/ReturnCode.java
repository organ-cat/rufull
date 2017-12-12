package com.cat.rufull.domain.common.util;

public class ReturnCode {

    public static final String ACCOUNT_ABNORMAL = "0";        //用户账号异常

    public static final String PHONE_PASSED = "10";            //手机号码通过

    public static final String PHONE_REGISTERED = "11";        //手机号码被注册了

    public static final String PHONE_FORMAT_ERROR = "12";      //手机号码格式错误

    public static final String EMAIL_PASSED = "20";             //邮箱号码通过

    public static final String EMAIL_REGISTERED = "21";         //邮箱号码被注册了

    public static final String EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误

    public static final String SEND_CHECKCODE = "30";            //发送注册码错误

    public static final String SNED_PHONE_CODE = "31";           //发送手机验证码成功

    public static final String SNED_EMAIL_CODE = "32";           //发送手机验证码成功

    public static final String LOGIN_SUCCESS = "100";            //登陆成功

    public static final String PASSWORD_ERROR = "101";           //密码错误

    public static final String REMOTE_LOGIN = "102";              //异地登陆

    public static final String REMOTE_CODE_ERROR = "103";        //异地登陆验证码错误

    public static final String SNED_REMOTE_CODE_SUCCESS = "104";           //异地登陆验证码发送成功

    public static final String BUSINESS_STATUS_REGISTERED = "0";

    public static final String BUSINESS_STATUS_SETTLED = "200";

    public static final String BUSINESS_STATUS_SETTLED_PASS = "201";

    public static final String BUSINESS_STATUS_CREATED_SHOP = "202";

    public static final String BUSINESS_STATUS_RECITIFY = "203";

    public static final String BUSINESS_STATUS_DELETE = "204";

    public static final String BUSINESS_STATUS_SETTLED_NOTPASS = "205";


    public static final String UPDATE_PASSWORD_SUCCESS = "300";

    public static final String UPDATE_PASSWORD_FAIL = "301";


}
