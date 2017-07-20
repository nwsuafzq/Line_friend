package cn.edu.nwsuaf.entity;

import java.io.Serializable;

/**
 * 收藏夹
 * @author 张琼
 * 2017-7-5
 */
public class Favourite implements Serializable {
	

	private static final long serialVersionUID = 1L;
	private int id;
	private int product_id;
	private String product_name;
	private double product_price;
	private String product_pic;
	
	private String email;
	
	

	
	public String getProduct_pic() {
		return product_pic;
	}
	public void setProduct_pic(String productPic) {
		product_pic = productPic;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double productPrice) {
		product_price = productPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
