package cn.edu.nwsuaf.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

@Controller
public class UpdateUserInfo {
	@RequestMapping("/Admin/UpdateUserInfo.action")
	public String userUpdate(HttpServletRequest request,HttpServletResponse response){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserDao userDao=ctx.getBean(UserDao.class);
		int userId=Integer.parseInt(request.getParameter("id"));
		String nickName =request.getParameter("nickName");
		String trueName =request.getParameter("trueName");
		String sex= request.getParameter("sex");
		String cardId= request.getParameter("cardId");
		String year= request.getParameter("year");
		String  mouth=request.getParameter("mouth");
		String  day=request.getParameter("day");
		System.out.println(userId+"--"+nickName+"--"+trueName+"--"+sex+"--"+cardId+"--"+year+"--"+mouth+"--"+day+"--");
		User user=userDao.findUserById(userId);
		user.setId(userId);
		user.setNickName(nickName);
		user.setTrueName(trueName);
		user.setSex(sex);
		user.setCardId(cardId);
		user.setYear(year);
		user.setMouth(mouth);
		user.setDay(day);
		userDao.UpdateInfo(user);
		return "/Admin/UserManage";
		}
}
