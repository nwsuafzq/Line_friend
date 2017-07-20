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
import org.springframework.web.multipart.MultipartFile;

import cn.edu.nwsuaf.controller.upload.UploadController;
import cn.edu.nwsuaf.dao.FoodDao;
import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.entity.Food;
import cn.edu.nwsuaf.entity.Product;
import cn.edu.nwsuaf.util.GetTimeUtil;

@Controller
public class ProductAddAction {

	@RequestMapping("/Admin/productAdd.action")
	public void productAdd(String product_name, String description,
			String fixed_price, String dangqian_price, String keywords,
			String producer, String produce_date, String expiration_date,
			String storge, String specification, MultipartFile file,HttpSession session,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		ProductDao productDao = ctx.getBean(ProductDao.class);
		FoodDao foodDao=ctx.getBean(FoodDao.class);
		
		Product product=new Product();
		product.setProduct_name(product_name);
		product.setDescription(description);
		product.setAdd_time(GetTimeUtil.getFormatDateProduct());
		product.setFixed_price(Float.parseFloat(fixed_price));
		product.setDangqian_price(Float.parseFloat(dangqian_price));
		product.setKeywords(keywords);
		String uploadPath=UploadController.saveFile(file, session);
		product.setProduct_pic(uploadPath);
		productDao.addProduct(product);
		
		//int product_id=productDao.findProductIdByName(product_name);
		Food food=new Food();
		//System.out.println(product.getId());
		food.setProduct_id(product.getId()); //插入product表的主键id
		food.setProducer(producer);
		food.setProduce_date(produce_date);
		food.setExpiration_date(Integer.parseInt(expiration_date));
		food.setSpecification(specification+"g");
		food.setStorge(Integer.parseInt(storge));
		food.setCategory(keywords);
		foodDao.addFood(food);
		
		//UploadController.saveFile(file, session);
		
		
		
		
		
		//return "forward:/Admin/ProductManage.jsp";
		request.getRequestDispatcher("/Admin/ProductManage.jsp").forward(request, response);
	}

}
