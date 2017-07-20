package cn.edu.nwsuaf.controller.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 图片验证码验证
 * @author 张琼
 * 2017-6-28
 */
@Controller
public class ImageVerification {
	@RequestMapping("/imageVerification.action")
	protected void imageVerification(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
		String verificationCode = (String) session
				.getAttribute("verificationCode");
		System.out.println(verificationCode+"---这是通过session传过来的获取验证码");
		String checkcode = request.getParameter("op");
		System.out.println(checkcode+"---这是用户输入的验证码");
		PrintWriter out = response.getWriter();
		if (checkcode.equals(verificationCode)) {
			out.println(1);
		} else {
			out.println(0);
		}
		out.flush();
		out.close();
	}
}
