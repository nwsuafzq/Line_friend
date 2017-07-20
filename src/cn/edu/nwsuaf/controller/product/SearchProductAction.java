package cn.edu.nwsuaf.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.SearchProductDao;
import cn.edu.nwsuaf.entity.Product;

/**
 * 搜索商品
 * @author 张琼
 * 2017-6-22
 */
@Controller
public class SearchProductAction {
	@RequestMapping("/searchProduct.action")
	public String searchProduct(String product_name,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");

		SearchProductDao searchProductDao = ctx.getBean(SearchProductDao.class);
	
		String searchContent = "%" + product_name + "%"; // 拼接一下 用于执行sql模糊查询
		session.setAttribute("product_name", product_name);
		
		List<Product> productList = searchProductDao
				.findProductsByName(searchContent);// 查询商品
		int productTotalCount = productList.size();// 商品总数

		System.out.println(productTotalCount);
		// productTotalCount=searchProductsTotalCountDao.findProductsTotalCountByName(searchContent);
		
		
		int countPage = (productTotalCount / 8) + 1; // 总页数，每页8个商品

		session.setAttribute("productList", productList); // list传过去

		session.setAttribute("countPage", countPage); // 页数传过去

		
		int pageNos=1; //页码；初始为1
		session.setAttribute("pageNos", pageNos);
		
		// productList.get(0).getProduct_name();

		// System.out.println(productList.toString());

		return "GoodsSearch";
	}
	@RequestMapping("/searchProductByPrice.action")
	public String searchProductByPrice(String pricelow,String pricehigh,HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");

		SearchProductDao searchProductDao = ctx.getBean(SearchProductDao.class);


		List<Product> productList = searchProductDao
				.findProductsByPrice(Double.parseDouble(pricelow),Double.parseDouble(pricehigh));// 查询商品
		int productTotalCount = productList.size();// 商品总数

		System.out.println(productTotalCount);

		int countPage = (productTotalCount / 8) + 1; // 总页数，每页8个商品

		session.setAttribute("productList", productList); // list传过去

		session.setAttribute("countPage", countPage); // 页数传过去

		
		int pageNos=1; //页码；初始为1
		session.setAttribute("pageNos", pageNos);
		
		return "GoodsSearch";
		
	}
	
	

}
