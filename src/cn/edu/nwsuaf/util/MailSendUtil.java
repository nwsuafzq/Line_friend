package cn.edu.nwsuaf.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



import cn.edu.nwsuaf.entity.MailInfo;

import java.util.Date;
import java.util.Properties;
/**
 * 发邮件工具类 支持html格式
 * @author 张琼
 * 2017-6-23
 */
public class MailSendUtil {
	private final static String host = "smtp.sina.com"; // sina的服务器
	private final static String formName = "";// 你的邮箱
	private final static String password = ""; // 授权码
	private final static String replayAddress = ""; // 你的邮箱

	public static void sendHtmlMail(MailInfo info) throws Exception {
		info.setHost(host);
		info.setFormName(formName);
		info.setFormPassword(password); // 网易邮箱的授权码~不一定是密码
		info.setReplayAddress(replayAddress);
		Message message = getMessage(info);
		// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
		Multipart mainPart = new MimeMultipart();
		// 创建一个包含HTML内容的MimeBodyPart
		BodyPart html = new MimeBodyPart();
		// 设置HTML内容
		html.setContent(info.getContent(), "text/html; charset=utf-8");
		mainPart.addBodyPart(html);
		// 将MiniMultipart对象设置为邮件内容
		message.setContent(mainPart);
		Transport.send(message);
	}

	public static void sendTextMail(MailInfo info) throws Exception {

		info.setHost(host);
		info.setFormName(formName);
		info.setFormPassword(password); // 网易邮箱的授权码~不一定是密码
		info.setReplayAddress(replayAddress);
		Message message = getMessage(info);
		// 消息发送的内容
		message.setText(info.getContent());

		Transport.send(message);
	}

	private static Message getMessage(MailInfo info) throws Exception {
		final Properties p = System.getProperties();
		p.setProperty("mail.smtp.host", info.getHost());
		p.setProperty("mail.smtp.auth", "true");
		p.setProperty("mail.smtp.user", info.getFormName());
		p.setProperty("mail.smtp.pass", info.getFormPassword());

		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session session = Session.getInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(p
						.getProperty("mail.smtp.user"), p
						.getProperty("mail.smtp.pass"));
			}
		});
		session.setDebug(true);
		Message message = new MimeMessage(session);
		// 消息发送的主题
		message.setSubject(info.getSubject());
		// 接受消息的人
		message.setReplyTo(InternetAddress.parse(info.getReplayAddress()));
		// 消息的发送者
		message.setFrom(new InternetAddress(p.getProperty("mail.smtp.user"),
				"LineFriend技术组"));
		// 创建邮件的接收者地址，并设置到邮件消息中
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(info
				.getToAddress()));
		// 消息发送的时间
		message.setSentDate(new Date());

		return message;
	}

	/*String s1111 = "dsadsa";

	String bbb = "<div>"
			+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">"
			+ "<tbody>"
			+ "<tr>"
			+ "<td style=\"border-bottom:4px solid #18a57c;\">&nbsp;</td>"
			+ "</tr>"
			+ "<tr>"
			+ "<td style=\"border:1px solid #ebebeb;box-shadow: 0 0 5px rgba(235, 235, 235, 1); -webkit-box-shadow: 0 0 5px rgba(235, 235, 235, 1); -moz-box-shadow: 0 0 5px rgba(235, 235, 235, 1);padding:25px;\">"
			+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font:14px/22px 微软雅黑,宋体,Arial;color:#555555;\" width=\"100%\">"
			+ "<tbody>"
			+ "<tr>"
			+ "<td><a href=\"#\" style=\"font-size: 13px; line-height: 20.8px;\" target=\"_blank\" title=\"Linefriend\"><font color=\"#333333\" face=\"sans-serif, Arial, Verdana, Trebuchet MS\"><img align=\"middle\" border=\"0\" src=\"https://ooo.0o0.ooo/2017/06/23/594c6d397bb27.png\"></font></a></td>"
			+ "<td align=\"right\"><font color=\"#333333\" face=\"sans-serif, Arial, Verdana, Trebuchet MS\"><span style=\"font-size: 13px; line-height: 20.8px;\"><font><font><a href=\"#\" target=\"_blank\" title=\"点击这里\">登录</a>&nbsp;</font></font><font><font>|"
			+ "</font></font><a href=\"#\" target=\"_blank\" title=\"点击这里\"><font><font>注册</font></font></a></span></font></td>"
			+ "</tr>"
			+ "</tbody>"
			+ "</table>"
			+ "<p>&nbsp;</p>"

			+ "<hr>"

			+ "<p>输入以下激活码，激活邮箱</p>"
			+ "<p>如果这不是你注册的请忽略。</p>"

			+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\"><strong><font color=\"#00B38A\"><span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\"></span>"
			+ s1111
			+ "</font></strong></font></p>"

			+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
			+ "<p>欢迎访问LineFriend！<span style=\"text-align: -webkit-center;\">&gt;&gt;&gt;</span></p>"
			+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
			+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
			+ "</td>" + "</tr>" + "</tbody>" + "</table>" + " </div>";*/

	/*
	 * Stringbb=
	 * "<tbody><tr><td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:url(https://shujubiji.cn/uppu/letterbg.png) no-repeat center center;margin-top:53px;width:500px;height:449px;box-shadow: 3px 3px 3px #eee\">"
	 * +"<tbody>" +"<tr>" +"<td align=\"center\" colspan=\"2\" valign=\"top\">"
	 * +
	 * "<h2 style=\"margin-top: 115px; color: rgb(18, 113, 190); line-height: 1.5;\">欢迎注册数据笔记<br>"
	 * +"输入以下激活码，激活您的账号。</h2>"
	 * 
	 * +"<h2 style=\"margin-top: 60px;\"></h2>" +"</td>" +"</tr>" +"<tr>"
	 * +"<td valign=\"bottom\">"
	 * +"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"214px\">"
	 * +"<tbody>" + "<tr>"
	 * +"	<td align=\"center\" height=\"130px\" valign=\"middle\">"+
	 * "<h3 style=\"width: 148px; color: rgb(100, 100, 100); font-size: 12px; text-align: left; padding-left: 10px; line-height: 2;\" >如果您的EMail客户端不能直接打开以上链接，<br>"
	 * +"请把右侧的链接复制到浏览<br>" +"器地址栏中打开：</h3>" +"</td>" +"</tr>" +"</tbody>"
	 * +"</table>" +"</td>" +"<td valign=\"bottom\">"
	 * +"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"287px\">"
	 * +"<tbody>" +"<tr>"
	 * +"<td align=\"center\" height=\"130px\" valign=\"middle\">"+
	 * "<p style=\"padding: 0 20px; color: rgb(100, 100, 100); word-wrap:break-word;word-break:break-word;line-height:1.75\"></p>"
	 * +"</td>" +"</tr>" +"</tbody>" +"</table>" +"</td>" +"</tr>" +"</tbody>"
	 * +"</table>" +"</td>" +"</tr>" +"</tbody>";
	 */
	/*@Test
	public void send() {
		String mail = "804194244@qq.com"; // 发送对象的邮箱
		String title = "我有一句话跟你说";
		String content = "<div>你不在学校吗？</div><br/><hr/><div>记得28号来学校</div>";
		MailInfo info = new MailInfo();
		info.setToAddress(mail);
		info.setSubject(title);
		info.setContent(bbb);
		try {
			MailSendUtil.sendHtmlMail(info);
		} catch (Exception e) {
			System.out.print("'" + title + "'的邮件发送失败！");
			e.printStackTrace();
		}
	}*/
}