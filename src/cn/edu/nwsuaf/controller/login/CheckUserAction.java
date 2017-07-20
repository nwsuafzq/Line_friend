package cn.edu.nwsuaf.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

/**
 * 检测email是否存在，然后给前端返回值。前端用了AJAX异步请求
 * @author 张琼
 * 2017-6-28
 */
@Controller
public class CheckUserAction {

	@RequestMapping("checkUser.action")
	public void checkUser(String email, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		System.out.println("11112");
		UserDao dao = ctx.getBean(UserDao.class);
		PrintWriter out = response.getWriter();
		// String email = request.getParameter("email");
		System.out.println("1111" + email);
		if (email.trim().equals("")) {
			out.print(2);// 2是不能为空
		} else {
			User e = dao.emailIsRegist(email);
			if (e != null) {
				out.print(1);// 1用户名已存在
			} else {
				out.print(3);// 用户名可以用
			}
		}
	}

}
