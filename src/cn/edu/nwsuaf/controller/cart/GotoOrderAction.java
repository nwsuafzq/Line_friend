package cn.edu.nwsuaf.controller.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.entity.Cart;
import cn.edu.nwsuaf.entity.Product;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

/**
 * @author 刘志伟
 *
 * 2017-6-27
 */
@Controller
public class GotoOrderAction {
	@RequestMapping("/gotoOrder.action")
	public String goToOrder(HttpServletRequest request,
			HttpServletResponse response) {// 获取收货地址
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		ProductDao productDao = ctx.getBean(ProductDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		User user = dao.findUserAddressById(user_id);// 返回用户
		List<UserAddress> userAddressList = user.getAddresses();// 获取地址
		
		String product_id = request.getParameter("id");
		String product_count = request.getParameter("num");
		System.out.println("获取的订单商品数据------"+product_id+"----"+product_count+"\n");
		String []pros = product_id.split(",");
		String []counts = product_count.split(",");
	
		
		int length = pros.length;
		for(int i = 0;i<length;i++){
			System.out.println(pros[i]);
		}
		List<Cart> list = new ArrayList<Cart>();
		for(int i = 0; i< length; i++){
			int id =Integer.parseInt(pros[i].trim());
			Product p = productDao.findProductById(id);
			Cart c = new Cart();
			c.setProduct(p);
			c.setProduct_count(Integer.parseInt(counts[i].trim()));
			c.setUser_id(user_id);
			list.add(c);
		}
		
		JSONArray jsonarray = JSONArray.fromObject(list);  
		System.out.println(jsonarray.toString());
		session.setAttribute("list", jsonarray.toString());

		request.setAttribute("list", list);
		request.setAttribute("addressList", userAddressList);
		return "order";
	}
	
	
	@RequestMapping("/direct.action")
	public String buy(HttpServletRequest request,
			HttpServletResponse response){
		
		// 获取收货地址
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		ProductDao productDao = ctx.getBean(ProductDao.class);
		HttpSession session = request.getSession();// 获取session
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		User user = dao.findUserAddressById(user_id);// 返回用户
		List<UserAddress> userAddressList = user.getAddresses();// 获取地址
		
		String product_id = request.getParameter("id");
		String product_count = request.getParameter("num");
		System.out.println("获取的订单商品数据------"+product_id+"----"+product_count+"\n");
	//	String []pros = product_id.split(",");
	//	String []counts = product_count.split(",");
	
		
	//	int length = pros.length;
	//	for(int i = 0;i<length;i++){
	//	System.out.println(pros[i]);
	//	}
		List<Cart> list = new ArrayList<Cart>();
	//	for(int i = 0; i< length; i++){
	//		int id =Integer.parseInt(pros[i].trim());
			Product p = productDao.findProductById(Integer.parseInt(product_id));
			Cart c = new Cart();
			c.setProduct(p);
			c.setProduct_count(Integer.parseInt(product_count));
			c.setUser_id(user_id);
			list.add(c);
	//	}
		
		JSONArray jsonarray = JSONArray.fromObject(list);  
		//System.out.println(jsonarray.toString());
		session.setAttribute("list", jsonarray.toString());

		request.setAttribute("list", list);
		request.setAttribute("addressList", userAddressList);
		return "order";
	
		//return "order";
	}
	
	
	
}
