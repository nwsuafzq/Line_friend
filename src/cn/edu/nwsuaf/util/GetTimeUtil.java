package cn.edu.nwsuaf.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 张琼 2017-6-13
 */
public class GetTimeUtil {
	/**
	 * 获取格式化的时间 输出格式：2015-08-04 20:55:35
	 */
	public static long getFormatDate() { // 注册登录用这个
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(date);
		return Long.parseLong(dateString); // 返回long基本数据类型

	}
	public static String getFormatDateProduct() { // 上架商品用这个
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateString = formatter.format(date);
		return dateString; // 

	}
	public static String getFormatDate1() { 
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(date);
		return dateString; // 返回String基本数据类型

	}
	

	// ------------------
	/**
	 * 获取时间戳 输出结果:1438692801766
	 */
	// @Test
	public void getTimeStamp() {
		Date date = new Date();
		long times = date.getTime();
		System.out.println(times);
	}

	/**
	 * 将时间戳转化为标准时间 输出：Tue Oct 07 12:04:36 CST 2014
	 */
	// @Test
	public void timestampToDate() {
		long times = 1412654676572L;
		Date date = new Date(times);
		System.out.println(date);
	}

}
