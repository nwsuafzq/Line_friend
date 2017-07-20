package cn.edu.nwsuaf.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

 @Controller
public class UserUpdate {
	@RequestMapping("/Admin/Updateuser.action")
	public String userUpdate(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserDao userDao=ctx.getBean(UserDao.class);
		int userId=Integer.parseInt(request.getParameter("id"));
		System.out.print(userId);
		User user=userDao.findUserById(userId);
		request.setAttribute("user",user);
		return "/Admin/UserManage";
	}
}
