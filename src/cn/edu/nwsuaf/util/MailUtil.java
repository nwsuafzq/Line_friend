package cn.edu.nwsuaf.util;

import java.util.UUID;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class MailUtil {
	public static String randomUUID() {
		UUID r = UUID.randomUUID();
		return r.toString();
	}

	public static void sendEmail(String email, String content) {
		SimpleEmail mailUtil = new SimpleEmail();

		mailUtil.setHostName("smtp.sina.com");

		mailUtil.setAuthentication("zhangq_nwafu@sina.com", "zhangqiong2008"); // QQ
																				// smtp:ughmuiftketvbeac
																				// pop3:blbktqbqgppdbbbg
																				// shouquan:dpovvzugjwpfbcgh
		// mailUtil.setAuthentication("zhaoyong1230@126.com", "zyq13572871783");

		mailUtil.setCharset("utf-8");

		try {
			mailUtil.addTo(email);
			mailUtil.setFrom("zhangq_nwafu@sina.com");
			mailUtil.setSubject("LineFriend注册邮箱验证");
			mailUtil.setMsg("欢迎您注册LineFriend! 您的验证码为:"+content);
			mailUtil.setSSL(true);
			mailUtil.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		String uUIDStr = randomUUID();
		
		// System.out.println(uUIDStr);
		sendEmail("804194244@qq.com", uUIDStr);
	}

}
