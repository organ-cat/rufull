package com.cat.rufull.domain.common.util;

public class RegEx {

    public static boolean regExPhone(String phone) {
        //匹配手机号码，必须符合中国移动，中国电信和中国联通的手机号码格式
        String regex  = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$";
        return phone.matches(regex);
    }

    public static boolean regExUsername(String username) {
        //必须是字母开头，用户名由字母，数字和_组成，2-20位
        String regex  = "[a-zA-Z]{1}[a-zA-Z0-9_]{2,20}";
        return username.matches(regex);
    }

    public static boolean regExEmail(String email) {
        if (email == null) {
            return false;
        }
        //邮箱验证
        String regex  = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
        return email.matches(regex);
    }
}
