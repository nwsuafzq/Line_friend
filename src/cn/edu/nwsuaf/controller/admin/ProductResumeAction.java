package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.ProductDao;

/**
 * @author 陈一婷
 */
@Controller
public class ProductResumeAction {
	@RequestMapping("/Admin/productResume.action")
	public void productResume(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		ApplicationContext ctx=new ClassPathXmlApplicationContext("springMVC.xml");
		ProductDao productDao=ctx.getBean(ProductDao.class);
		HttpSession session=request.getSession();
		
		String sel=(String) session.getAttribute("sel");
		String condition=(String) session.getAttribute("condition");
		
		String id=request.getParameter("id");
		int productId=Integer.parseInt(id);
		
		productDao.resumeProductById(productId);
		
		response.sendRedirect("foodSearch.action?sel="+sel+"&condition="+condition);
	}
}
