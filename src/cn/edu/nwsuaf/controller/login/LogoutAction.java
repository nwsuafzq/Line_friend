package cn.edu.nwsuaf.controller.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 张琼 2017-6-20
 */
@Controller
public class LogoutAction {
	@RequestMapping("/logout.action")
	public void logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		session.removeAttribute("userid");
		session.removeAttribute("email");
		response.sendRedirect("home.jsp");
		// return "";
	}
}
