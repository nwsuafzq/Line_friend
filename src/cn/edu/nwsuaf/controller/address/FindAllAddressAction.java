package cn.edu.nwsuaf.controller.address;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

/**
 * @author 刘志伟
 *
 * 2017-6-21
 */

@Controller
public class FindAllAddressAction {
	@RequestMapping("/findAllAddress.action")
	public String findAllAddress(HttpServletRequest request){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		HttpSession session =request.getSession();//获取session
		Integer user_id = (Integer) session.getAttribute("userid");//获取userid
		System.out.println(user_id+"获取到user_id");
		
		User user = dao.findUserAddressById(user_id);//返回用户
		
		System.out.println(user.toString());//打印用户信息包含地址
		
		List<UserAddress> addressList = user.getAddresses();//获取地址
		request.setAttribute("size", addressList.size());//获取 地址list大小传回页面
		request.setAttribute("addressList", addressList);
		
		return "UserAddress";
	}
	

}
