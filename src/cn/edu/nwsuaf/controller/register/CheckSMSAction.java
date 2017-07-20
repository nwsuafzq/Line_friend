package cn.edu.nwsuaf.controller.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 张琼
 * 2017-6-24
 */
@Controller
public class CheckSMSAction {
	@RequestMapping("/checksms.action")
	public void checkSMS(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session=request.getSession();
		int mobile_code= (Integer) session.getAttribute("mobile_code");

		/*if(session.getAttribute("mobile_code")!=null){
		int mobile_code= (Integer) session.getAttribute("mobile_code");
		}else{
			int mobile_code=0;
		}*/
		System.out.println(mobile_code+"-----session传来的");
		String mobile_codestr=String.valueOf(mobile_code); //传过来的是int转换成string
		System.out.println(mobile_codestr+"-----!!!!");
		String smsco = request.getParameter("smsco");
		System.out.println(smsco+"---这是用户输入的验证码");
		PrintWriter out = response.getWriter();
		if (smsco.equals(mobile_codestr)) {
			System.out.println("一致");
			out.println(1);
		} else {
			System.out.println("不一致");
			out.println(0);
		}
		out.flush();
		out.close();
		
	}
		
}
