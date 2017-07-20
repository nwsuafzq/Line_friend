package cn.edu.nwsuaf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*Qian*/
public class AdminLoginFilter implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			   FilterChain chain) throws IOException, ServletException {
			  // 获得在下面代码中要用的request,response,session对象
			  HttpServletRequest servletRequest = (HttpServletRequest) request;
			  HttpServletResponse servletResponse = (HttpServletResponse) response;
			  HttpSession session = servletRequest.getSession();
			  
			  String path = servletRequest.getRequestURI();
			  
			  String AdminName = (String) session.getAttribute("AdminName");
			  
			  
			  // 登陆页面无需过滤
			  /*if(path.indexOf("/Admin/AdminLogin.jsp") > -1) {
			   chain.doFilter(servletRequest, servletResponse);
			   return;
			  }
			  // 判断如果没有取到员工信息,就跳转到登陆页面
			  if ( AdminName== null || "".equals(AdminName)) {
			   // 跳转到登陆页面
			   servletResponse.sendRedirect("/Admin/AdminLogin.jsp");
			  } else {
			   // 已经登陆,继续此次请求
			   chain.doFilter(request, response);
			  }*/
			 }
			 public void destroy() {
			}
			
}
