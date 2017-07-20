package cn.edu.nwsuaf.entity;

import java.util.List;

public class User {
	private int id;
	private String email;
	private String password;
	private String user_integral;// 用户分类
	private String last_login_ip;
	private long last_login_time;
	private String is_email_verify;
	private String email_verify_code;

	// 添加个人信息

	private String nickName;
	private String trueName;
	private String sex;
	private String cardId;
	private String year;
	private String mouth;
	private String day;
	
	private String head_image;//用户头像
	
	//关联
	private List<UserAddress> addresses;// 一对多 一个user对应对个收获地址

	@Override
	public String toString() {
		return "User [addresses=" + addresses + ", cardId=" + cardId + ", day="
				+ day + ", email=" + email + ", email_verify_code="
				+ email_verify_code + ", head_image=" + head_image + ", id="
				+ id + ", is_email_verify=" + is_email_verify
				+ ", last_login_ip=" + last_login_ip + ", last_login_time="
				+ last_login_time + ", mouth=" + mouth + ", nickName="
				+ nickName + ", password=" + password + ", sex=" + sex
				+ ", trueName=" + trueName + ", user_integral=" + user_integral
				+ ", year=" + year + "]";
	}

	public String getHead_image() {
		return head_image;
	}

	public void setHead_image(String headImage) {
		head_image = headImage;
	}
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMouth() {
		return mouth;
	}

	public void setMouth(String mouth) {
		this.mouth = mouth;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public List<UserAddress> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<UserAddress> addresses) {
		this.addresses = addresses;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_integral() {
		return user_integral;
	}

	public void setUser_integral(String userIntegral) {
		user_integral = userIntegral;
	}

	public String getLast_login_ip() {
		return last_login_ip;
	}

	public void setLast_login_ip(String lastLoginIp) {
		last_login_ip = lastLoginIp;
	}

	public long getLast_login_time() {
		return last_login_time;
	}

	public void setLast_login_time(long lastLoginTime) {
		last_login_time = lastLoginTime;
	}

	public String getIs_email_verify() {
		return is_email_verify;
	}

	public void setIs_email_verify(String isEmailVerify) {
		is_email_verify = isEmailVerify;
	}

	public String getEmail_verify_code() {
		return email_verify_code;
	}

	public void setEmail_verify_code(String emailVerifyCode) {
		email_verify_code = emailVerifyCode;
	}

}
