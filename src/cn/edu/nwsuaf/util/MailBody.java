package cn.edu.nwsuaf.util;

/**
 * 拼接邮件内容的类
 * 
 * @author 张琼 2017-6-23
 */
public class MailBody {

	public static String mailBodyContent(String code) {
		String body = "<div>"
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
				+ "<td><a href=\"http://www.nwafu.me\" style=\"font-size: 13px; line-height: 20.8px;\" target=\"_blank\" title=\"Linefriend\"><font color=\"#333333\" face=\"sans-serif, Arial, Verdana, Trebuchet MS\"><img align=\"middle\" border=\"0\" src=\"https://ooo.0o0.ooo/2017/06/23/594c6d397bb27.png\"></font></a></td>"
				+ "<td align=\"right\"><font color=\"#333333\" face=\"sans-serif, Arial, Verdana, Trebuchet MS\"><span style=\"font-size: 13px; line-height: 20.8px;\"><font><font><a href=\"#\" target=\"_blank\" title=\"点击这里\">登录</a>&nbsp;</font></font><font><font>|"
				+ "</font></font><a href=\"http://www.nwafu.me\" target=\"_blank\" title=\"点击这里\"><font><font>注册</font></font></a></span></font></td>"
				+ "</tr>"
				+ "</tbody>"
				+ "</table>"
				+ "<p>&nbsp;</p>"

				+ "<hr>"

				+ "<p>输入以下激活码，激活邮箱</p>"
				+ "<p>如果这不是你注册的请忽略。</p>"

				+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\"><strong><font color=\"#00B38A\"><span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\"></span>"
				+ code
				+ "</font></strong></font></p>"

				+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
				+ "<p>欢迎访问LineFriend！<span style=\"text-align: -webkit-center;\">&gt;&gt;&gt;</span></p>"
				+ "<p>LineFriend技术组敬上！ 有问题请联系：zq@nwafu.me | 此邮件勿回复<span style=\"text-align: -webkit-center;\"></span></p>"
				+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
				+ "<p align=\"center\"><font color=\"#00B38A\" font=\"\">&nbsp;</font></p>"
				+ "</td>" + "</tr>" + "</tbody>" + "</table>" + " </div>";
		return body;
	}
}
