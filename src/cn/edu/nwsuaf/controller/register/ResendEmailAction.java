package cn.edu.nwsuaf.controller.register;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.MailInfo;
import cn.edu.nwsuaf.util.MailBody;
import cn.edu.nwsuaf.util.MailSendUtil;
import cn.edu.nwsuaf.util.MailUtil;

/**
 * 重新发送验证邮件Action类
 * 
 * @author 张琼 2017-6-24
 */

@Controller
public class ResendEmailAction {
	@RequestMapping("/reSendEmail.action")
	public String reSendEmail(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao userDao = ctx.getBean(UserDao.class);
		
		String email=request.getParameter("email");
		
		String email_verify_code = MailUtil.randomUUID(); // 生成随机码
		System.out.println(email_verify_code);
		userDao.updateEmailVerifyCodeByEmail(email, email_verify_code);	//更新数据库中的邮箱验证码
		
		/* 发送邮箱激活验证码  HTML格式*/
		String title = "LineFriend邮箱激活";
		String content= MailBody.mailBodyContent(email_verify_code);
		MailInfo info = new MailInfo();
		info.setToAddress(email);
		info.setSubject(title);
		info.setContent(content);
		MailSendUtil.sendHtmlMail(info);
		
		request.setAttribute("email", email);
		
		return "verify_form";
	}
}
