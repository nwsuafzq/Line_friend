package cn.edu.nwsuaf.controller.address;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

/**
 * @author 刘志伟
 *
 * 2017-6-15
 */
@Controller
public class AddUserAddressAction {
	@RequestMapping("/addUserAddress.action")
	public void addAddress(HttpServletRequest request,HttpServletResponse response, UserAddress address){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		UserDao userDao = ctx.getBean(UserDao.class);
		HttpSession session =request.getSession();//获取session
		Integer userid = (Integer) session.getAttribute("userid");//获取userid
		System.out.println(userid+"获取到userid");
		User user = new User();
		user = userDao.findUserById(userid);
		address.setUser(user);
		address.toString();
		
		dao.addUserAddress(address);
		try {
			response.sendRedirect("findAllAddress.action");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
