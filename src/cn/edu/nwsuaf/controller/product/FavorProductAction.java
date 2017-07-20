package cn.edu.nwsuaf.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.ProductDao;

/**
 * @author 张琼 2017-7-5
 */
@Controller
public class FavorProductAction {
	@RequestMapping("/favor.action")
	public void favor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		ProductDao dao = ctx.getBean(ProductDao.class);

		String email = request.getParameter("email");
		String product_id = request.getParameter("product_id");
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_pic=request.getParameter("product_pic");
		
		dao.favorProduct(Integer.parseInt(product_id), email,product_name,Double.parseDouble(product_price),product_pic);
		
		
		request.getRequestDispatcher("showProductdetail.action?id=" + product_id).forward(request,response);

	}

}
