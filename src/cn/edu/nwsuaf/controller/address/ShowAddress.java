package cn.edu.nwsuaf.controller.address;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

@Controller
public class ShowAddress {
	@RequestMapping("/showAddress.action")
	public String findAllAddress(HttpServletRequest request){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		HttpSession session =request.getSession();//获取session
		Integer user_id = (Integer) session.getAttribute("userid");//获取userid
		User user = dao.findUserAddressById(user_id);//返回用户
		List<UserAddress> userAddressList = user.getAddresses();//获取地址
		request.setAttribute("addList", userAddressList);
		
		return "order";
	}
}
