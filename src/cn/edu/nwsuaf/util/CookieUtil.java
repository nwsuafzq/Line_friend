package cn.edu.nwsuaf.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * cookie工具�?提供了cookie的创�?查找,删除方法�?
 */
public class CookieUtil {
	private static String path = "/dangdang";
	private static int deFault_age = 3600;

	/**
	 * 添加cookie,考虑了编码问�?
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public static void addCookie(String name, String value,
			HttpServletResponse res, int age)
			throws UnsupportedEncodingException {
		Cookie c = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		c.setMaxAge(age);
		c.setPath(path);
		res.addCookie(c);
	}

	/**
	 * 使用缺省时间来创建cookie
	 */
	public static void addCookie(String name, String value,
			HttpServletResponse res) throws UnsupportedEncodingException {
		addCookie(name, value, res, deFault_age);
	}

	/**
	 * 依据cookie的名称查找cookie的�? 如果name对应的cookie不存�?返回null
	 */
	public static String findCookie(String name, HttpServletRequest req)
			throws UnsupportedEncodingException {
		String value = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie curr = cookies[i];
				if (curr.getName().equals(name)) {
					value = URLDecoder.decode(curr.getValue(), "utf-8");
				}
			}
		}
		return value;
	}

	/**
	 * 依据cookie的名称删除该cookie
	 */
	public static void delete(String name, HttpServletResponse res) {
		Cookie c = new Cookie(name, "");
		c.setMaxAge(0);
		c.setPath(path);
		res.addCookie(c);
	}
}
