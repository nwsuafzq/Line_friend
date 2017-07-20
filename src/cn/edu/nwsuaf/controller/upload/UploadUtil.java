/**
 * author 刘志伟
 * 2017-7-2
 */
package cn.edu.nwsuaf.controller.upload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author 刘志伟
 *
 * 2017-7-2
 */
@Controller
public class UploadUtil {
	@RequestMapping("/upload.action")
	public String upload(@RequestParam MultipartFile[] headImag,
			HttpServletRequest request) throws IOException {
			for(MultipartFile file : headImag){   
				//此处MultipartFile[]表明是多文件,如果是单文件MultipartFile就行了
	            if(file.isEmpty()){ 
	            	System.out.println("文件未上传!");
	            }
	            else{
	            	//得到上传的文件名
					String fileName = file.getOriginalFilename();
					//得到服务器项目发布运行所在地址
					String path1 = request.getSession().getServletContext().getRealPath("assests/homeImages/headImage")+File.separator;
					//  此处未使用UUID来生成唯一标识,用日期做为标识
					String path = path1+ new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ fileName;
					//查看文件上传路径,方便查找
					System.out.println(path);
					//把文件上传至path的路径
					File localFile = new File(path);
					file.transferTo(localFile);
					}
				}
			return "uploadSuccess";
		}

}
