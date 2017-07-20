/**
 * author 刘志伟
 * 2017-6-28
 */
package cn.edu.nwsuaf.controller.order;
import cn.edu.nwsuaf.dao.CartDao;
import cn.edu.nwsuaf.dao.ItemDao;
import cn.edu.nwsuaf.dao.OrderDao;
import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.Cart;
import cn.edu.nwsuaf.entity.Item;
import cn.edu.nwsuaf.entity.Order;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author 刘志伟
 *
 * 2017-6-28
 */
@Controller
public class SubmitOrderAction {
	@SuppressWarnings("unchecked")
	@RequestMapping("/submitOrder.action")
	public void submitOrder(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		ItemDao itemDao = ctx.getBean(ItemDao.class);
		OrderDao orderDao = ctx.getBean(OrderDao.class);
		CartDao cartDao = ctx.getBean(CartDao.class);
		UserDao userDao = ctx.getBean(UserDao.class);
		UserAddressDao addressDao = ctx.getBean(UserAddressDao.class);
		
		//获取传过来的用户选择的地址id和留言
		String addressId = request.getParameter("id");
		String message = request.getParameter("message");
		
		HttpSession session = request.getSession();
		//获取订单中内容
		String listString = (String) session.getAttribute("list");
		System.out.println("购物车中的session:---"+listString);
		
		//创建一个订单orderId
		Date time = new Date();
		String orderId = new SimpleDateFormat("yyyyMMddHHmmss").format(time);
		System.out.println("订单id--"+orderId);
		
		//获取用户id
		Integer user_id = (Integer) session.getAttribute("userid");// 获取userid
		System.out.println(user_id);
		
		
		User user = addressDao.findUserAddressById(user_id);
		
		
		String address="";
		String receive_name="";
		String phone ="";
		
		
		List<UserAddress> listAddress = user.getAddresses();
		for(UserAddress a:listAddress){
			if(a.getId()==Integer.parseInt(addressId)){
				 address = a.getProvince()+"省 "+a.getCity()+"市  "+a.getDistrict()+"区 "+a.getFull_address();
				 receive_name = a.getReceive_name();
				 phone = a.getPhone();
			}
		}
		
		String order_time =new SimpleDateFormat("yyyy/MM/dd").format(time);
		
		//String 转化为List
		JSONArray jsonArray = JSONArray.fromObject(listString);  
        List<Cart> list = (List<Cart>) JSONArray.toCollection(jsonArray,Cart.class); 
        //遍历两种方式
        for(Cart c : list){
			System.out.println("购物车中cart中的对象："+c.toString());
		}
        
        Iterator it = list.iterator();  
        //总价
        double price_amount=0.0;
        while(it.hasNext()){  
        	Cart c = (Cart)it.next();
        	Item item = new Item();
        	item.setOrder_id(orderId);
        	item.setProduct_id(c.getProduct().getId());
        	item.setProduct_name(c.getProduct().getProduct_name());
        	item.setPrice(c.getProduct().getDangqian_price());
        	item.setProduct_num(c.getProduct_count());
        	double price = item.getPrice();
        	int num = item.getProduct_num();
        	//计算没件商品的总价
        	double per_price_amount = price*num;
        	//累加订单的总价
        	price_amount+=per_price_amount;
        	
        	item.setAmount(per_price_amount);
        	
        	//将每条商品item写入数据库
        	itemDao.insertIntoItem(item);
        	//将购物车中的商品删除
        	cartDao.delterCartItem(c.getProduct().getId());
        }  
        
        Order order = new Order();
        order.setAddress_id(addressId);
        order.setId(orderId);
        order.setMessage(message);
        order.setOrder_time(order_time);
        order.setPrice_amount(String.valueOf(price_amount));
        order.setUser_id(user_id);
        order.setStatus("1");
        
        
        orderDao.insertIntoOrder(order);
        
		UUID r = UUID.randomUUID();//UUID无构造函数，不可改
		//String price = "0.02";
		try {
			response.sendRedirect("toPay.action?orderId="+orderId+"&price="+price_amount+"&receive_name="+receive_name+"&address="+address+"&phone="+phone);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return "payWay";
		
	}
	
	
}
