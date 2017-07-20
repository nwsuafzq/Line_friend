package cn.edu.nwsuaf.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.entity.Product;

/**
 * @author 刘志伟
 * 
 *         2017-6-23
 */
@Controller
public class LoadProductAction {
	@RequestMapping("/loadProduct.action")
	@ResponseBody
	public String load(HttpServletRequest request,HttpServletResponse response) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		ProductDao dao = ctx.getBean(ProductDao.class);
		List<Product> productList = dao.findAllProduct();
		//request.setAttribute("productList", productList);
		//打印获取的数
		for(Product p:productList){
			System.out.println(p.toString());
		}
		//转化为json对象
		JSONArray jao=JSONArray.fromObject(productList);
		System.out.println(jao.toString());
		response.setContentType("text/html;charset=UTF-8");  
		try {
			response.getWriter().print(jao.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return null;
	}

}
