package com.cat.rufull.domain.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Luckily on 2017/12/6.
 */
public class DateFormat {
    public static Date getNewdate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        Date newDate = null;
        try {
            newDate = formatter.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return newDate;
    }
}
