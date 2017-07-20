package cn.edu.nwsuaf.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.CategorySearchDao;
import cn.edu.nwsuaf.entity.Product;

/**
 * 点击分类搜索出商品
 * @author 张琼
 * 2017-6-23
 */
@Controller
public class SearchProductByCateAction {
	@RequestMapping("/searchByCategory.action")
	public String searchByCatalog(String keywords, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		CategorySearchDao catalogSearchDao = ctx.getBean(CategorySearchDao.class);

		/*
		 * List<Food> foodList = catalogSearchDao.findFoodByCategory(category);
		 * List productList = new ArrayList<Product>(); for (Food food :
		 * foodList) {
		 * 
		 * int product_id =
		 * catalogSearchDao.findProductIdByFoodId(food.getId());
		 * System.out.println(food.getId());
		 * productList.add(catalogSearchDao.findProductByProductId(product_id));
		 * }
		 */

		List<Product> productList = catalogSearchDao
				.findProductsByKeywords(keywords);
		/*
		 * System.out.println(productList);
		 * System.out.println(productList.size());
		 */
		session.setAttribute("productList", productList);
		int pageNos = 1;
		session.setAttribute("pageNos", pageNos);
		return "GoodsSearch";

	}

}
