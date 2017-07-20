package cn.edu.nwsuaf.controller.register;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nwsuaf.util.ImageUtil;

/**
 * 生成图片验证码
 * @author 张琼
 * 2017-6-28
 */
@Controller
public class ImageVerifyCodeAction {
	@RequestMapping("/imageVerifyCode.action")
	public void imageVerifyCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ServletOutputStream sos = response.getOutputStream();
		BufferedImage image = ImageUtil.getImage();
		StringBuffer code=ImageUtil.randomCode;//四位验证码
		HttpSession session = request.getSession();         
	    session.setAttribute("verificationCode", code.toString());         
		System.out.println(code+"生成验证码");
		ImageIO.write(image, "jpeg", sos);
		sos.close();
	}
}
