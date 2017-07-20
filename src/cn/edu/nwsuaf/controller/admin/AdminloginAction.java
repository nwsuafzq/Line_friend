package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.AdminDao;
import cn.edu.nwsuaf.entity.Admin;

@Controller
public class AdminloginAction {

	@RequestMapping("/Admin/adminlogin.action")
	public String login(String userName, String password,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		AdminDao adminDao = ctx.getBean(AdminDao.class);
		/*Qian*/
		HttpSession session=request.getSession();
		


		System.out.println(userName + "  管理员"+password+"  密码");

		Admin user = new Admin();
		user.setAdminName(userName);
		user.setPassword(password);

		Admin admin = adminDao.findByLogin(user);
		//Admin admin = adminDao.findByLogin1(userName,password);
		if (admin == null) {
			System.out.println("dsadsads对方发送方式");
			return "/Admin/AdminLogin";
		} else {

			session.setAttribute("AdminName", userName);
			System.out.println("userName"+userName);
			return "/Admin/AdminMsg";

		}
		
	}
}
