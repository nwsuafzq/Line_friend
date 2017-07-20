package cn.edu.nwsuaf.controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.CommentDao;
import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.util.GetTimeUtil;

@Controller
public class CommentSendAction {
	@RequestMapping("commentSend.action")
	public String snedComment(String cmtcontent,int product_id,String anonymous,String upvote,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		CommentDao commentDao = ctx.getBean(CommentDao.class);
		if(session.getAttribute("email")==null){
			request.setAttribute("error", "你还没登录！");
			request.setAttribute("id", product_id);
			return "forward:showProductdetail.action?id="+product_id;
		}
		else{
			String email=(String)session.getAttribute("email");
			
			if("anon".equals(anonymous)){	//判断是否选择匿名了
				String email1=email.substring(0, 3);
				String email2=email.substring(email.length()-2, email.length());
				email=email1+"****"+email2;
			}
			if("hate".equals(upvote)){	//判断选的是赞还是踩
				upvote="踩";
			}else{
				upvote="赞";
			}
			
			commentDao.addComment(cmtcontent, email, GetTimeUtil.getFormatDate1(),upvote, product_id);
			request.setAttribute("id", product_id);
			return "redirect:showProductdetail.action?id="+product_id;
		}
		

	}
}
