package cn.edu.nwsuaf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

public class ProtectFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		System.out.println("LOG:ProtectFilter-deFilter()");
		javax.servlet.http.HttpServletRequest request = (javax.servlet.http.HttpServletRequest) arg0;

		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userid");
		String eamil = (String) session.getAttribute("email");

		if (eamil == null || userId == null) {
			System.out.println("LOG : 尚未登录！！");
			request.getSession().setAttribute("message", "你尚未登录，请登录...");
			javax.servlet.http.HttpServletResponse res = (javax.servlet.http.HttpServletResponse) arg1;
			res.sendRedirect(request.getContextPath() + "/UserLogin.jsp");
		} else {
			arg2.doFilter(arg0, arg1);
		}

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
