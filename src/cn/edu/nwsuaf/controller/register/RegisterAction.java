package cn.edu.nwsuaf.controller.register;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.MailInfo;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.util.EncryptUtil;
import cn.edu.nwsuaf.util.GetIpUtil;
import cn.edu.nwsuaf.util.GetTimeUtil;
import cn.edu.nwsuaf.util.MailBody;
import cn.edu.nwsuaf.util.MailSendUtil;
import cn.edu.nwsuaf.util.MailUtil;

@Controller
public class RegisterAction {
	/**
	 * @throws Exception 
	 * @throws IOException
	 * 用户注册 以及 判断是否Email被注册了 创建时间：2017-6-13 开发者：张琼
	 * @参数： @param email
	 * @参数： @param password
	 * @参数： @param request
	 * @参数： @return
	 * @return String
	 * @throws
	 */
	@RequestMapping("/register.action")
	public String registerUser(String email, String password,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao userDao = ctx.getBean(UserDao.class);
		
		
		User u_flag = userDao.emailIsRegist(email); // 首先判断邮箱是否已被注册

		if (u_flag != null) { // 经过通过email查询数据库是否存在此email,若不存在则u_flag为null，存在就不为null

			return "UserLogin"; // 存在这个email则跳转 //TODO

		} else {
			User user = new User(); // 声明一个User对象存email和password
			user.setEmail(email);
			user.setPassword(EncryptUtil.md5Encrypt(password)); // 给密码加密
			user.setIs_email_verify("n"); //是否已经验证邮箱，刚注册都是默认未验证"n"
			user.setUser_integral("1"); // 通过注册方法注册的用户都是普通用户，即为"1"

			String ip =GetIpUtil.getIpAddr(request); // 获取IP
			user.setLast_login_ip(ip); // 用户注册时就获取它的IP作为最后一次登录IP

			long time = GetTimeUtil.getFormatDate(); // 获取时间
			user.setLast_login_time(time);

			String verifycode = MailUtil.randomUUID(); // 生成随机码
			user.setEmail_verify_code(verifycode); // 随机码存入数据库

			//MailUtil.sendEmail(email, verifycode); // 给邮箱发送随机验证码
			
			/* 发送邮箱激活验证码  HTML格式*/
			String title = "LineFriend邮箱激活";
			String content= MailBody.mailBodyContent(verifycode);
			MailInfo info = new MailInfo();
			info.setToAddress(email);
			info.setSubject(title);
			info.setContent(content);
			MailSendUtil.sendHtmlMail(info);
			
			user.setHead_image("morentouxiang.jpg");//设置默认头像
			
			userDao.register(user); // 传入user对象参数，调用注册

			request.setAttribute("email", email);
//			session.setAttribute("email", email);
			
			int userid = userDao.findByEmailToId(email);
			
			session.setAttribute("userid", userid);
			System.out.println("注册页面Session"+userid);
			
			return "verify_form"; // 跳转页面 //TODO
		}

		// }
	}
}
