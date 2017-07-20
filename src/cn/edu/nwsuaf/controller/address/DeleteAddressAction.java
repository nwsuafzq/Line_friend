/**
 * author 刘志伟
 * 2017-6-21
 */
package cn.edu.nwsuaf.controller.address;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserAddressDao;
import cn.edu.nwsuaf.dao.UserDao;

/**
 * @author 刘志伟
 *
 * 2017-6-21
 */
@Controller
public class DeleteAddressAction {
	@RequestMapping("/deleteAddress.action")
	public void deleteUserAddress(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserAddressDao dao = ctx.getBean(UserAddressDao.class);
		String id = request.getParameter("id");
		System.out.println(id);
		dao.deleteAddress(Integer.parseInt(id));
		try {
			response.sendRedirect("findAllAddress.action");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
