package cn.edu.nwsuaf.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

/**
 * @author 刘志伟
 * 
 *         2017-6-22
 */
@Controller
public class GetUserInfoAction {
	@RequestMapping("/getUserInfo.action")
	public String getUserInfo( HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao dao = ctx.getBean(UserDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer userid = (Integer) session.getAttribute("userid");// 获取userid
		User user = dao.findUserById(userid);
		request.setAttribute("user",user);
		return "EditUserMessage";

	}

}
