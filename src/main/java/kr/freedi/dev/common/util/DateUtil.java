package kr.freedi.dev.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @project : dev_default
 * @file 	: DateUtil.java
 * @date	: 2017. 4. 3.
 * @author	: pdh
 * @comment :  
 * @history	: 
 */

public class DateUtil {
	
	/**
	 * 현재 날짜를 yyyyMMdd 포맷으로 반환.
	 * @return String 현재 날짜.
	 */
	public static String getSysDate() {
		return getSysDate("yyyyMMddHHmmss");
	}
	
	/**
	 * 날짜 입력양식을 전달받아 현재 날짜를 반환.
	 * @param pattern 입력 양식.
	 * @return String 날짜 입력 양식.
	 */
	public static String getSysDate(String pattern) {
		return getDateString(new Date(), pattern);
	}
	
	/**
	 * Date 객체와 입력양식을 전달받아 날짜를 반환.
	 * @param date Date 객체.
	 * @param pattern 입력 양식.
	 * @return String 날짜.
	 */
	public static String getDateString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
	
	/**
	 * 숫자형태의 시간과 포맷을 전달받아 날짜를 반환.
	 * @param time 숫자형태의 시간
	 * @param pattern 시간 포맷
	 * @return String 날짜
	 */
	public static String getDateString(long time, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date d = new Date(time);
		return sdf.format(d);
	}
}



