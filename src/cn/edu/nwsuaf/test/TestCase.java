package cn.edu.nwsuaf.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.nwsuaf.dao.ProductDao;
import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.Product;
import cn.edu.nwsuaf.entity.User;

public class TestCase {
	@Test
	public void test1_saveUser() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao dao = ctx.getBean(UserDao.class);
		User user = new User();
		user.setEmail("testcase@126.com");
		user.setPassword("123");
		dao.register(user);
	}
	@Test
	public void test2_findProductById(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		ProductDao dao = ctx.getBean(ProductDao.class);
	    Product p=dao.findProductById(2);
	    p.toString();
	}
}
