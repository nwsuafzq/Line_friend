package cn.edu.nwsuaf.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.Order;
import cn.edu.nwsuaf.entity.OrderDetails;
import cn.edu.nwsuaf.entity.Orders;
import cn.edu.nwsuaf.entity.User;

/**
 * 我的订单
 * 
 * @author 吴思颖 2017-6-22
 */
@Controller
public class UserOrderAction {
	@RequestMapping("/userOrder.action")
	public String searchProduct(String product_name,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LOG : userOrder.action");
		HttpSession session = request.getSession();
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		
		// 登录验证
		if (user_id == null) {
			return "UserLogin";
		} else { 
			UserDao userDao = ctx.getBean(UserDao.class);
			User user = userDao.findUserById(user_id);

			OrderDao orderDao = ctx.getBean(OrderDao.class);// 实例化
			
			System.out.println("-------------------------------");
			List<Order> orderList = orderDao.findUserOrderByUserId(user_id);
			
			request.setAttribute("orderList", orderList);
			request.setAttribute("user", user);
			return "UserOrder";
		}
	}
	
	@RequestMapping("/deleteOrder.action")
	public String deleteOrder(String product_name,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LOG : userOrder.action");
		HttpSession session = request.getSession();
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		String id = request.getParameter("id");
		
		// 登录验证
		if (user_id == null) {
			return "UserLogin";
		} else { 
			UserDao userDao = ctx.getBean(UserDao.class);
			User user = userDao.findUserById(user_id);
			OrderDao orderDao = ctx.getBean(OrderDao.class);// 实例化
			orderDao.deleteOrder(id);
			try {
				response.sendRedirect("userOrder.action");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		return null;
	}
	
	
	
	
	
	
	
}
