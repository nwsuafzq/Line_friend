package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.dao.UserAddressDao;

@Controller
public class DeleteOrderAction {
	@RequestMapping("/Admin/deleteOrder.action")
	public void deleteOrder(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		OrderDao dao = ctx.getBean(OrderDao.class);
		String id = request.getParameter("id");
		System.out.println(id);
		dao.deleteOrder(id);
		try {
			response.sendRedirect("findAllOrder.action#panel-Odelect");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
