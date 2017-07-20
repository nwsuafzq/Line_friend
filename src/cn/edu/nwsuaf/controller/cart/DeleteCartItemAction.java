/**
 * author 刘志伟
 * 2017-6-27
 */
package cn.edu.nwsuaf.controller.cart;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.CartDao;

/**
 * @author 刘志伟
 *
 * 2017-6-27
 */
@Controller
public class DeleteCartItemAction {
	
	@RequestMapping("deleteCartItem.action")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		CartDao cartDao = ctx.getBean(CartDao.class);
		String id = request.getParameter("id");
		cartDao.delterCartItem(Integer.parseInt(id));
		try {
			response.sendRedirect("showCart.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//return null;
	}
	
	
	
	
	
	

}
