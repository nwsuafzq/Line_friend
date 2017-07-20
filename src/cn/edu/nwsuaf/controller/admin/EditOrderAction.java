package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.entity.Orders;

@Controller
public class EditOrderAction {
	@RequestMapping("/Admin/editOrder.action")
	public void UpdateOrder(String id,String stateName,HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		OrderDao dao = ctx.getBean(OrderDao.class);
		//String id = request.getParameter("id");
		//String state=request.getParameter("stateName");
		System.out.println(id);
		System.out.println(stateName);
		dao.updateOrder(id,stateName);
		//System.out.println(order.toString());
		//dao.deleteAddress(Integer.parseInt(id));
		//request.setAttribute("editOrder", order);
		try {
			response.sendRedirect("findAllOrder.action#panel-Oupdate");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
