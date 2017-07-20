package cn.edu.nwsuaf.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.CommentDao;
import cn.edu.nwsuaf.dao.FoodDao;
import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.entity.Comment;
import cn.edu.nwsuaf.entity.Food;
import cn.edu.nwsuaf.entity.Product;

/**
 * @author 刘志伟
 * 
 * 2017-6-23
 */
@Controller
public class ShowProductDetailAction {
	@RequestMapping("/showProductdetail.action")
	public String show(HttpServletRequest request) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		ProductDao dao = ctx.getBean(ProductDao.class);
		
		FoodDao foodDao = ctx.getBean(FoodDao.class);
		CommentDao commentDao = ctx.getBean(CommentDao.class);
		
		String id = request.getParameter("id");
		
		request.setAttribute("id", id);
		
		Product p = dao.findProductById(Integer.parseInt(id));
		request.setAttribute("product", p);
		System.out.println(p.toString());
		
		Food food = foodDao.findFoodByProductId(Integer.parseInt(id));
		request.setAttribute("food", food);
		
		List<Comment> commentList =commentDao.findCommentsByProductId(Integer.parseInt(id));
		request.setAttribute("commentList", commentList);
		
		return "Goods";

	}

}
