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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	public FilterConfig config;

	public void doFilter(ServletRequest request, ServletResponse response,

	FilterChain chain) throws IOException, ServletException {
		System.out.println("LOG：SessionFilter-doFilter()");
		HttpServletRequest httpreq = (HttpServletRequest) request;// 定义request

		HttpServletResponse httpres = (HttpServletResponse) response;// 定义response

		String noFilter = config.getInitParameter("noFilter");// 在web.xml中取得不过滤的值

		String past = config.getInitParameter("past");// 获取设置过期跳转的页面

		String uri = httpreq.getRequestURI();// 获取你操作的路径

		String context = httpreq.getContextPath();// 获取项目路径根路径

		if (!uri.equals(context + "/")// 对取得的路径进行匹配，过期的情况下

				&& !uri.equalsIgnoreCase(context + "/" + past)

				&& !checkUrl(uri, context, noFilter)) {

			HttpSession httpSession = httpreq.getSession(false);// 如果获取不到Session,则不会给你创建一个Seesion给你

			if (httpSession == null) {

				httpres.sendRedirect(context + "/" + past);// 重新定向路径过期路径

				return;

			}

		}

		HttpSession session = httpreq.getSession();
		Integer userId = (Integer) session.getAttribute("userid");
		String email = (String) session.getAttribute("email");
		
		System.out.println("LOG : email = "+email );
		
		if (email == null || userId == null) {
			httpreq.getSession().setAttribute("message", "你尚未登录，请登录...");
			httpres.sendRedirect(httpreq.getContextPath() + "/login.action");
		}
		chain.doFilter(request, response);

	}

	public void destroy() {

		this.config = null;

	}

	public void init(FilterConfig filterConfig) throws ServletException {

		this.config = filterConfig;

	}

	// 检查路径是否在不做处理的路径内

	private boolean checkUrl(String uri, String context, String noFilter) {

		boolean isFilter = false;

		if (noFilter != null && !noFilter.equals("")) {// 定义不作处理的路径不为空

			String[] url = noFilter.split(",");// 对路径进行分割

			for (int i = 0; i < url.length; i++) {// 遍历不做出来的路径

				if (uri.equalsIgnoreCase(context + "/" + url[i])) {// 进行比对

					isFilter = true;

					break;

				}

			}

		}

		return isFilter;

	}

}