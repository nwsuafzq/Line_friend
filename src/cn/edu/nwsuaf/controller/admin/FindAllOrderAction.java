package cn.edu.nwsuaf.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.entity.Order;

@Controller
public class FindAllOrderAction {
	@RequestMapping("/Admin/findAllOrder.action")
	public String findAllOrder(HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		OrderDao dao = ctx.getBean(OrderDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		System.out.println(user_id + "获取到user_id");

		List<Order> ordersList = dao.findAllOrder();// 返回用户

		for (Order o : ordersList) {

			System.out.println(o.toString());// 打印用户信息包含地址
		}
		//ArrayList<Orders> orders = new ArrayList<Orders>();
		// List<Orders> orders = (List<Orders>) order;//获取地址
		// request.setAttribute("size", addressList.size());//获取 地址list大小传回页面
		// request.setAttribute("addressList", order);
		//System.out.println(order.getRs_address());// 打印用户信息包含地址
		request.setAttribute("orderList", ordersList);
		return "/Admin/OrderManage";
	}
}
