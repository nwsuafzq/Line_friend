package cn.edu.nwsuaf.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.entity.Item;
import cn.edu.nwsuaf.entity.Order;
import cn.edu.nwsuaf.entity.UserAddress;

@Controller
public class ShowOrderAction {
	@RequestMapping("/Admin/showOrder.action")
	public String showOrder(HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		OrderDao dao = ctx.getBean(OrderDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		System.out.println(user_id + "获取到user_id");
		String id=request.getParameter("id");
		System.out.print(id);
		String address_id=request.getParameter("address_id");
		
		List<UserAddress> addressList = dao.findAddressById(address_id);// 返回收货地址
		System.out.println(address_id + "获取到address_id");
		
		List<Item> itemList = dao.findItemById(id);// 返回订单详情
		List<Order> orderitemList = dao.findOrderByorder_id(id);// 返回订单
		
		
		for (Item i : itemList) {

			System.out.println(i.toString());// 打印用户信息包含地址
		}
		for (UserAddress o : addressList) {

			System.out.println(o.toString());// 打印用户信息包含地址
		}
		//ArrayList<Orders> orders = new ArrayList<Orders>();
		// List<Orders> orders = (List<Orders>) order;//获取地址
		// request.setAttribute("size", addressList.size());//获取 地址list大小传回页面
		// request.setAttribute("addressList", order);
		//System.out.println(order.getRs_address());// 打印用户信息包含地址
		request.setAttribute("addressList", addressList);
		request.setAttribute("itemList", itemList);
		request.setAttribute("orderitemList", orderitemList);
		return "/Admin/OrderManage";
	}
}
