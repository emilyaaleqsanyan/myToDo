package com.example.mytodo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");


    public static Date stringToDateTime(String dateTimeStr) throws ParseException {
        return SDF.parse(dateTimeStr);
    }


    public static String dateTimeToString(Date date) {
        return SDF.format(date);

    }
}
