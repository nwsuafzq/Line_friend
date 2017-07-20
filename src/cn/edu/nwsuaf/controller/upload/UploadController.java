package cn.edu.nwsuaf.controller.upload;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 上传
 * @author 张琼
 * 2017-7-2
 */
@Controller
public class UploadController {


	/*
	 * /** 上传单个文件的页面
	 * 
	 * @return 页面的路径
	 *//*
		 * @RequestMapping(value = "/uploadfile.action", method =
		 * RequestMethod.GET) public String uploadFilePage() { return
		 * "upload-file"; }
		 */

	/**
	 * 上传单个文件
	 * 
	 * @param file
	 * 上传文件 MultipartFile 的对象
	 * @return 上传的结果
	 */
	@RequestMapping(value = "/uploadfile.action", method = RequestMethod.POST)
	public String uploadFile(MultipartFile file, HttpSession session) {
		//System.out.println("dsadsadasdsa啊啊啊啊啊" + file.toString());
		saveFile(file, session);
		return "index"; //TODO
	}
	/**
	 * 把 HTTP 请求中的文件流保存到本地
	 * 
	 * @param file
	 * MultipartFile 的对象
	 */
	public static String saveFile(MultipartFile file, HttpSession session) {
		if (!file.isEmpty()) {
			try {
				
				//System.out.println(session.getServletContext().getRealPath("/")); 
				//System.out.println(File.separator + file.getOriginalFilename());  
				
				String webappsPath = session.getServletContext().getRealPath("/");//web服务器下webapps文件夹下工程文件夹下路径
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String datestr = sdf.format(date);
				String rootFile = webappsPath +"assets/upload/"+ datestr; //保存的路径：getRealPath/assets/upload/当前时间->作为路径
				File filedirs = new File(rootFile);
				if (!filedirs.exists()) { //判断是否存在，若不存在则创建
					filedirs.mkdirs();
				}
				String path = rootFile + File.separator+ file.getOriginalFilename();
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path));
				return "assets/upload/"+ datestr+File.separator+ file.getOriginalFilename();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "";
		
	}
}