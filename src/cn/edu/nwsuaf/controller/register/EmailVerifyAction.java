package cn.edu.nwsuaf.controller.register;

import javax.servlet.http.HttpServletRequest;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;

/**
 * 邮件激活验证Action类
 * @author 张琼 2017-6-14
 */
@Controller
public class EmailVerifyAction {

	@RequestMapping("/emailVerify.action")
	public String userEmailVerify(String email, String code,
			HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao userDao = ctx.getBean(UserDao.class);
		// System.out.println(email);
		String verifycode = userDao.emailVerifyCode(email);
	
		// System.out.println("shishi:" + code + "...." + verifycode);
		if (code.equals(verifycode)) {
			// System.out.println("fail" + code + "...." + verifycode);
			
			userDao.emailVerifySuccess(email); 	//通过验证后，将is_email_verify改为"y" 即已经验证过
//			HttpSession session = request.getSession();
			request.setAttribute("email", email);
			return "home"; // 验证成功
			// request.setAttribute(arg0, arg1);
		} else {
			// System.out.println(code + "...." + verifycode);
			request.setAttribute("email", email);
			request.setAttribute("verifyFail", "验证失败");
			return "verify_form"; // 验证失败
		}
	}
}
