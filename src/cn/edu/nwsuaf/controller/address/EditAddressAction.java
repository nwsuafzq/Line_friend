
package cn.edu.nwsuaf.controller.address;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.entity.UserAddress;

/**
 * @author 刘志伟
 *
 * 2017-6-21
 */
@Controller
public class EditAddressAction {
	@RequestMapping("/editAddress.action")
	public String UpdateAddress(HttpServletRequest request ){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		String id = request.getParameter("id");
		UserAddress address = dao.updateAddress(Integer.parseInt(id));
		System.out.println(address.toString());
		dao.deleteAddress(Integer.parseInt(id));
		request.setAttribute("editAddress", address);
		return "AddUserAddress";
		
	}

}
