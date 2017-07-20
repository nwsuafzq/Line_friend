package cn.edu.nwsuaf.controller.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendSMSAction {
	
	@RequestMapping("/sendsms.action")
	public void sendSMS(String mobile,HttpServletRequest request,HttpServletResponse response) {
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=utf-8");
		int mobile_code = (int)((Math.random()*9+1)*100000);
		
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "C17586719"), //查看用户名请登录用户中心->验证码、通知短信->帐户及签名设置->APIID
			    new NameValuePair("password", "51d94112d6bc149aaf5397f5eb218a1b"),  //查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", mobile),
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);
		try {
			client.executeMethod(method);
			String SubmitResult =method.getResponseBodyAsString();
			//System.out.println(SubmitResult);
			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();
			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");
			PrintWriter out = response.getWriter();
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			 if("2".equals(code)){
				System.out.println("短信提交成功");
				out.println(1);
			}
			 
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();         
	    session.setAttribute("mobile_code", mobile_code);
	}
}
