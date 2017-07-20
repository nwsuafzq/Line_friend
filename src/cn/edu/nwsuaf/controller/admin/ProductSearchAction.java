package cn.edu.nwsuaf.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class ProductSearchAction {
	@RequestMapping("/Admin/foodSearch.action")
	public String productSearch(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		ProductDao productDao=ctx.getBean(ProductDao.class);
		
		List<Product> productList=null;
		
		String sel=request.getParameter("sel");
		String condition=request.getParameter("condition");
		
		HttpSession session=request.getSession();
		session.setAttribute("condition", condition);
		session.setAttribute("sel", sel);
		
		if(sel.equals("1")){
			productList=productDao.findAllProduct1();
			
		}else if(sel.equals("2")){
			productList=productDao.findProductById1(Integer.parseInt(condition));
			
		}else if(sel.equals("3")){
			productList=productDao.findProductByCategory(condition);
			
		}else if(sel.equals("4")){
			productList=productDao.findProductByName(condition);
			
		}else if(sel.equals("5")){
			productList=productDao.findProductByPrice(Double.parseDouble(condition));
			
		}else if(sel.equals("6")){
			productList=productDao.findProductByAddTime(Long.parseLong(condition));
			
		}
		
		request.setAttribute("productList",productList);
		
		return "/Admin/ProductManage";
	}
}

