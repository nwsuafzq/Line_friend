package cn.edu.nwsuaf.controller.login;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.controller.register.IsVerifyEmail;
import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.util.EncryptUtil;
import cn.edu.nwsuaf.util.GetIpUtil;
import cn.edu.nwsuaf.util.GetTimeUtil;
/**
 * @author 张琼 2017-6-13
 */
@Controller
public class LoginAction {
	/**
	 * @throws IOException ServletException 
	 * 创建时间：2017-6-14 开发者：张琼
	 * @参数： @param email password request
	 * @return String
	 */
	@RequestMapping("/login.action")
	public String login(String email, String password,
			HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao userDao = ctx.getBean(UserDao.class);

		String encrypt_pwd=EncryptUtil.md5Encrypt(password); //将密码转码后再去和数据库中比较
		
		User user_is_exist = userDao.findByEmail(email); // 查email是否在数据库中
		if (user_is_exist != null) { // 数据库中有这个email; 再查是否email和password匹配
			User user = userDao.findByLogin(email, encrypt_pwd);
			
			if (user != null) { // 登陆成功
				
				User userLastLogin=new User();
				userLastLogin.setLast_login_time(GetTimeUtil.getFormatDate());
				userLastLogin.setLast_login_ip(GetIpUtil.getIpAddr(request));
				userLastLogin.setEmail(email);
				userDao.updateLastLogin(userLastLogin);	//登陆成功就更新最后一次登陆时间 和 IP
				
				boolean isVerified = IsVerifyEmail.isVerifyEmail(email); // 判断是否验证过邮箱了
				if (isVerified) {
					int userid = userDao.findByEmailToId(email);
					
					HttpSession session = request.getSession();
					session.setAttribute("userid", userid);
					System.out.println(userid+"session设置userID");
					
					session.setAttribute("email", email); // 将email传过去
					return "home"; // 跳主页面
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("email", email); // 将email传过去
					request.setAttribute("email", email); // 将email传过去
					return "verify_form"; // TODO //未验证则跳转验证页面 继续验证
				}

			} else { // 用户名密码不对
				request.setAttribute("loginError", "登录失败");
				return "UserLogin";// TODO //跳回登录页面
			}

		} else { // 数据库中没有这个email
			request.setAttribute("loginError", "该邮箱未注册");
			return "UserLogin";// TODO 这里要跳回登录页面

		}

	}
}
