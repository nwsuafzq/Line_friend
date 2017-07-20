package cn.edu.nwsuaf.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.entity.Order;

@Controller
public class SearchOrderAction {
	@RequestMapping("/Admin/searchOrder.action")
	public String userSearch(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		OrderDao orderDao=ctx.getBean(OrderDao.class);
		List<Order> orderList=null;
		
		String select=request.getParameter("select");
		String condtion=request.getParameter("condtion");
		System.out.print("select:"+select);
		System.out.print("condtion:"+condtion);
		if(select.equals("1")){
			//查询所有用户
			System.out.print("查询全部用户信息");
			orderList=orderDao.findAllOrder();
		}
		if(select.equals("2")){
			//订单	
				System.out.print("按订单编号查询");
				orderList=orderDao.findOrderByorder_id(condtion);
		}
		if(select.equals("3")){
			//下单时间
			System.out.print("按下单时间查询");
			orderList=orderDao.findOrderByorder_time(condtion);
		}
		if(select.equals("4")){
			//ID
			
			System.out.print("按用户ID查询");
			orderList=orderDao.findOrderByuser_id(Integer.parseInt(condtion));
		}
		
		request.setAttribute("orderList", orderList);

		return "/Admin/OrderManage";
	}

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}
}
