package com.cat.rufull.domain.common.util;

public class RegEx {
    /**
     * 校验是否是手机号码
     * @param phone 手机号码
     * @return
     */
    public static boolean regExPhone(String phone) {
        if (phone == null) {
            return false;
        }
        //匹配手机号码，必须符合中国移动，中国电信和中国联通的手机号码格式
        String regex  = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,3-9]))\\d{8}$";
        return phone.matches(regex);
    }

    /**
     * 校验是否是用户名
     * @param username  用户名
     * @return
     */
    public static boolean regExUsername(String username) {
        if (username == null) {
            return false;
        }
        //必须是字母开头，用户名由字母，数字和_组成，2-20位
        String regex  = "[a-zA-Z]{1}[a-zA-Z0-9_]{2,20}";
        return username.matches(regex);
    }

    /**
     * 校验是否是邮箱号码
     * @param email 邮箱号码
     * @return
     */
    public static boolean regExEmail(String email) {
        if (email == null) {
            return false;
        }
        //邮箱验证
        String regex  = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
        return email.matches(regex);
    }
}
