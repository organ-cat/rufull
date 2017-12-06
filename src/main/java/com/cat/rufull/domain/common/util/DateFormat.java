package com.cat.rufull.domain.common.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Luckily on 2017/12/6.
 */
public class DateFormat {
    public static Date getNewdate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        ParsePosition pos = new ParsePosition(8);
        Date newdate = formatter.parse(dateString, pos);
        return newdate;
    }
}
