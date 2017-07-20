package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;

@Controller
public class UserDeleteAction {
	@RequestMapping("/Admin/UserDelect.action")
	public void UserDelect(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserDao userDao=ctx.getBean(UserDao.class);
		HttpSession session=request.getSession();
		
		String select=(String) session.getAttribute("select");
		System.out.print("select:--"+select);
		String condtion=(String) session.getAttribute("condtion");
		System.out.print("condtion--"+condtion);
		//int userId = (Integer) request.getAttribute("userId2");//得到用户id;
		String userId = request.getParameter("id");
		System.out.print("删除用户ID"+userId);
		//通过ID找到用户；
		//调用接口删除用户；
		//删除完成;
		int Id=Integer.parseInt(userId);
		try {
			
			userDao.deleteUserById(Id);
			System.out.print("成功删除");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.print("删除失败");
		}
		try {
			response.sendRedirect("userSearch.action?condtion="+condtion+"&select="+select);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.print("失败！");
		}
		
		//return "/Admin/UserManage";
		
		
	}
}
