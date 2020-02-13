package helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelper {
    /**
     * Chuyển đổi từ Date sang String
     * 
     * @param date là Date cần chuyển đổi
     * @return String kết quả
     */

    public static String DateToString(Date date) {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	return dateFormat.format(date);
    }

    /**
     * Chuyển đổi từ String sang Date
     * 
     * @param str là String cần chuyển đổi
     * @return Date kết quả
     */
    public static Date StringToDate(String str) {
	Date date = null;
	try {
	    date = new SimpleDateFormat("yyyy/MM/dd").parse(str);
	    return date;
	} catch (ParseException e) {
	    return null;
	}
    }

    /**
     * Lấy thời gian hiện tại
     * 
     * @return Date kết quả
     */
    public static Date now() {
	return new Date();
    }
}
