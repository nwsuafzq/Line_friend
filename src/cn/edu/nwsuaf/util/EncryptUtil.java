package cn.edu.nwsuaf.util;

import java.io.IOException;
import java.security.MessageDigest;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 密码转码
 * 
 * @author 张琼 2017-6-13
 */
public class EncryptUtil {
	public static String md5Encrypt(String s) {
		if ("".equals(s) || s == null) {
			return "";
		}
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bys = md.digest(s.getBytes());
			// System.out.println(Arrays.toString(bys));
			return Base64Encrypt(bys);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public static String Base64Encrypt(byte[] bys) { // 转成base64编码
		BASE64Encoder base = new BASE64Encoder();
		String s = base.encode(bys);
		return s;
	}

	public static byte[] Base64Decrypt(String s) throws IOException { // base64解码
		BASE64Decoder base = new BASE64Decoder();
		byte[] bys = base.decodeBuffer(s);
		return bys;
	}

	public static void main(String[] args) {
		String password = "123";
		String s = md5Encrypt(password);
		System.out.println(s);

		// s = md5Encrypt("123");
		// System.out.println(s);
	}
}
