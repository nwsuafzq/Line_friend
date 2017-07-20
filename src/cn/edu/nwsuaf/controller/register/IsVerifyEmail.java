package cn.edu.nwsuaf.controller.register;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.nwsuaf.dao.UserDao;

/**
 * 是否通过邮箱验证的方法
 * @author 张琼
 * 2017-6-14
 */
public class IsVerifyEmail {
	
	public static boolean isVerifyEmail(String email){
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"springMVC.xml");
		UserDao userDao = ctx.getBean(UserDao.class);
		String isVerify= userDao.isEmailVerify(email);
		if("y".equals(isVerify)){
			return true;    //验证过了则为true
		}else{
			return false;	//没验证过则为false
		}	
	}

}
