/**
 * author 刘志伟
 * 2017-7-3
 */
package cn.edu.nwsuaf.controller.user;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

/**
 * @author 刘志伟
 * 
 *         2017-7-3
 */
@Controller
public class FindUserInfoAction {
	@RequestMapping("/findUserInfo.action")
	public String getUserInfo(HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao dao = ctx.getBean(UserDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer userid = (Integer) session.getAttribute("userid");// 获取userid
		User user = dao.findUserById(userid);
		
		System.out.println("获取用户的头像"+user.toString());
	
		session.setAttribute("user", user);
		session.setAttribute("headImage", user.getHead_image());
		
		
		return "User";

	}
}
