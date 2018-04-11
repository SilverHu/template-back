package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * 时间工具类
 * 
 * @author SilverHu
 *
 */
public class DateUtils {
	public static String yMdHms = "yyyy-MM-dd HH:mm:ss";
	public static String yMd = "yyyy-MM-dd";

	/**
	 * 格式化字符串
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date parse(String date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 格式化时间戳
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date parse(Long date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(date);
		return calendar.getTime();
	}

	/**
	 * 格式化字符串
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String format(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	/**
	 * 将日期转化为Unix时间戳
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Long format(Date date) {
		Calendar now = Calendar.getInstance();
		now.setTime(date);
		return now.getTimeInMillis();
	}

	/**
	 * 将Unix时间戳转化为日期字符串
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String format(Long date, String format) {
		return DateUtils.format(DateUtils.parse(date),format);
	}

	/**
	 * 将日期字符串转化为Unix时间戳
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Long format(String date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar now = Calendar.getInstance();
		try {
			now.setTime(sdf.parse(date));
		} catch (ParseException e) {
			return null;
		}
		return now.getTimeInMillis();
	}

	/**
	 * 获取几天前/几天后的时间（相对于指定日期）
	 * 
	 * @param date
	 *            时间
	 * @param days
	 *            负：几天前/正：几天后
	 * @param format
	 *            日期格式
	 * @return
	 */
	public static String format(Date date, int days, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Calendar now = Calendar.getInstance();
		now.setTime(date);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + days);
		return sdf.format(now.getTime());
	}

	/**
	 * 获取几天前/几天后的时间戳（相对于指定日期）
	 * 
	 * @param date
	 *            时间
	 * @param days
	 *            负：几天前/正：几天后
	 * @return
	 */
	public static Long format(Date date, int days) {
		Calendar now = Calendar.getInstance();
		now.setTime(date);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + days);
		return now.getTimeInMillis();
	}

}
