package cn.edu.nwsuaf.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.entity.Favourite;
import cn.edu.nwsuaf.entity.Product;

@Controller
public class FavouriteList {
	
	@RequestMapping("/gotoFavouriteList.action")
	public String gotoFavouriteList(String email,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession();
		
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC.xml");
		ProductDao dao = ctx.getBean(ProductDao.class);
		
		List<Favourite> favouriteList=dao.findFavouriteProByEmail(email);
		
		session.setAttribute("favouriteList", favouriteList);
		
		return "UserFavorite";
	}
	
}
