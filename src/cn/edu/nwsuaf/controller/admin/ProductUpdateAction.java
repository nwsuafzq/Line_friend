package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.FoodDao;
import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.entity.Food;
import cn.edu.nwsuaf.entity.Product;

/**
 * @author 陈一婷
 */
@Controller
public class ProductUpdateAction {
	@RequestMapping("/Admin/productUpdate.action")
	public void productUpdate(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		ApplicationContext ctx=new ClassPathXmlApplicationContext("springMVC.xml");
		ProductDao productDao=ctx.getBean(ProductDao.class);
		FoodDao foodDao=ctx.getBean(FoodDao.class);
		
		String id=request.getParameter("id");
		int productId=Integer.parseInt(id);
		System.out.println(id);
		
		String name=request.getParameter("productName");
		System.out.println(name);
		
		String description=request.getParameter("description");
		System.out.println(description);
		
		String price=request.getParameter("price");
		double productPrice=Double.parseDouble(price);
		System.out.println(price);
		
		String category=request.getParameter("category");
		System.out.println(category);
		
		Product product=new Product();
		product.setId(productId);
		product.setProduct_name(name);
		product.setDescription(description);
		product.setDangqian_price(productPrice);
		product.setKeywords(category);
		productDao.updateProductInfo(product);
		
		String storage=request.getParameter("storage");
		int foodStorage=Integer.parseInt(storage);
		
		Food food=new Food();
		food.setProduct_id(product.getId());
		food.setStorge(foodStorage);
		foodDao.updateFoodInfo(food);
		response.sendRedirect("foodSearch.action?sel=1&condition=#panel-Pupdate");
		
	}
}
