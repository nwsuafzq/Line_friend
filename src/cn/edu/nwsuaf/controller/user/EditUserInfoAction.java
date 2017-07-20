package cn.edu.nwsuaf.controller.user;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.nwsuaf.dao.UserDao;
import cn.edu.nwsuaf.entity.User;

/**
 * @author 刘志伟
 * 
 *         2017-6-22
 */
@Controller
public class EditUserInfoAction {
	@RequestMapping("/editUserInfo.action")
	public void edit(HttpServletRequest request, HttpServletResponse response,
			User user,@RequestParam MultipartFile[] headImage) throws IllegalStateException, IOException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"springMVC.xml");
		UserDao dao = ctx.getBean(UserDao.class);
		
		
		//获取上传头像
		String fileName="";
		for(MultipartFile file : headImage){   
			//此处MultipartFile[]表明是多文件,如果是单文件MultipartFile就行了
            if(file.isEmpty()){ 
            	System.out.println("文件未上传!");
            }
            else{
            	//得到上传的文件名
				 fileName = file.getOriginalFilename();
				//得到服务器项目发布运行所在地址
				String path1 = request.getSession().getServletContext().getRealPath("assets/homeImages/headImage")+File.separator;
				//  此处未使用UUID来生成唯一标识,用日期做为标识
				fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
				String path = path1+ fileName;
				//查看文件上传路径,方便查找
				System.out.println(path);
				//把文件上传至path的路径
				File localFile = new File(path);
				file.transferTo(localFile);
				System.out.println("上传成功");
				}
			}
		
		HttpSession session = request.getSession();// 获取session
		Integer userid = (Integer) session.getAttribute("userid");// 获取userid

		user.setId(userid);
		user.setHead_image(fileName);
		
		System.out.println(user.toString());

		dao.editUserInfo(user);
		

		try {
			response.sendRedirect("findUserInfo.action");// 跳转到我的LINE FRIEND
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*request.setAttribute("head_image", fileName);
		request.setAttribute("trueName", user.getTrueName());
		//修改完个人信息后跳到个人主页上
		return "User";*/

	}

}
