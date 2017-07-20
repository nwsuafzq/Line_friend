package cn.edu.nwsuaf.util;

import javax.servlet.http.HttpServletRequest;

//获取真实IP的工具类
/**
 * @author 张琼 2017-6-13
 */
public class GetIpUtil {
	/**
	 * @Title: getIpAddr
	 * @param: @param request
	 * @param: @return
	 * @return: String
	 * @author: 张琼
	 * @date: 2017-6-13 下午03:50:21
	 * @throws
	 */
	public static String getIpAddr(HttpServletRequest request) {

		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;

	}

	// public static void main(String[] args) {
	//		
	// GetIpUtil.getIpAddr(request);
	// }

}
