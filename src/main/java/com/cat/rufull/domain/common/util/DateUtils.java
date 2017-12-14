package com.cat.rufull.domain.common.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.concurrent.TimeUnit;

public class DateUtils {
    /**
     * Compute the number of calendar days between two Calendar objects.
     * The desired value is the number of days of the month between the
     * two Calendars, not the number of milliseconds' worth of days.
     * @param startCal The earlier calendar
     * @param endCal The later calendar
     * @return the number of calendar days of the month between startCal and endCal
     */
    public static long calendarDaysBetween(Calendar startCal, Calendar endCal) {

        // Create copies so we don't update the original calendars.
        // Set the copies to be at midnight, but keep the day information.

        Calendar start = getCalendarDate(startCal);

        Calendar end = getCalendarDate(endCal);

        // At this point, each calendar is set to midnight on
        // their respective days. Now use TimeUnit.MILLISECONDS to
        // compute the number of full days between the two of them.

        return TimeUnit.MILLISECONDS.toDays(
                Math.abs(end.getTimeInMillis() - start.getTimeInMillis()));
    }

    /**
     * 获取今日日期
     * @return 今日日期 格式为:yyyy-MM-dd 00:00:00
     */
    public static Calendar getCalendarToday() {
        return getCalendarDate(Calendar.getInstance());
    }

    /**
     * 获取精确到"年-月-日"的日期
     * @param cal 传入日期
     * @return 该日日期 格式为:yyyy-MM-dd 00:00:00
     */
    public static Calendar getCalendarDate(Calendar cal) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeZone(cal.getTimeZone());
        calendar.setTimeInMillis(cal.getTimeInMillis());

        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        return calendar;
    }
}
