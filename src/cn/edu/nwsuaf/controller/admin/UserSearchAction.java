package cn.edu.nwsuaf.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

/**
 * @author Qian
 *
 */
@Controller
public class UserSearchAction {
	@RequestMapping("/Admin/userSearch.action")
	public String userSearch(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserDao userDao=ctx.getBean(UserDao.class);
		List<User> userList=null;
		
		String select=request.getParameter("select");
		String condtion=request.getParameter("condtion");
		HttpSession session=request.getSession();
		session.setAttribute("select",select);
		session.setAttribute("condtion",condtion);
		System.out.print("select:"+select);
		System.out.print("condtion:"+condtion);
		if(select.equals("1")){
			//查询所有用户
			System.out.print("查询全部用户信息");
			userList=userDao.findAllUser();
		}
		if(select.equals("2")){
			//邮箱
			System.out.print("按邮箱查询");
			userList=userDao.findUserByEmail(condtion);
		}
		if(select.equals("3")){
			//性别
			System.out.print("按性别查询");
			userList=userDao.findUserBySex(condtion);
		}
		if(select.equals("4")){
			//ID
			System.out.print("按ID查询");
			userList=userDao.findUserByIdList(Integer.parseInt(condtion));
		}
		
		if(select.equals("5")){
			//昵称
			System.out.print("按昵称查询");
			userList=userDao.findUserByNickName(condtion);
		}
		if(select.equals("6")){
			//年龄
			System.out.print("按年龄查询");
			userList=userDao.findUserByAge(Integer.parseInt(condtion));
			
		}
		
		request.setAttribute("userList", userList);
		return "/Admin/UserManage";
	}
}
