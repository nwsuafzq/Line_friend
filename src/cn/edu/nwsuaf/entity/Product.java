package cn.edu.nwsuaf.entity;

import java.io.Serializable;

/**
 * 商品类
 * @author 张琼 2017-6-21
 */
public class Product implements Serializable{
	
	private static final long serialVersionUID = -770873775097386917L;
	private int id;
	private String product_name;
	private String description;
	private String add_time; //添加商品的时间
	private double fixed_price; //商品打折价格
	private double dangqian_price;//商品当前价格
	private String keywords;//商品关键词
	private int has_deleted;//是否被删除 标志位
	private String product_pic;//商品图片地址
	private Cart2 cart2;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAdd_time() {
		return add_time;
	}
	public void setAdd_time(String addTime) {
		add_time = addTime;
	}
	public double getFixed_price() {
		return fixed_price;
	}
	public void setFixed_price(double fixedPrice) {
		fixed_price = fixedPrice;
	}
	public double getDangqian_price() {
		return dangqian_price;
	}
	public void setDangqian_price(double dangqianPrice) {
		dangqian_price = dangqianPrice;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getHas_deleted() {
		return has_deleted;
	}
	public void setHas_deleted(int hasDeleted) {
		has_deleted = hasDeleted;
	}
	public String getProduct_pic() {
		return product_pic;
	}
	public void setProduct_pic(String productPic) {
		product_pic = productPic;
	}
	
	public Cart2 getCart2() {
		return cart2;
	}
	public void setCart2(Cart2 cart2) {
		this.cart2 = cart2;
	}
	
	@Override
	public String toString() {
		return "Product [add_time=" + add_time + ", cart2=" + cart2
				+ ", dangqian_price=" + dangqian_price + ", description="
				+ description + ", fixed_price=" + fixed_price
				+ ", has_deleted=" + has_deleted + ", id=" + id + ", keywords="
				+ keywords + ", product_name=" + product_name
				+ ", product_pic=" + product_pic + "]";
	}
	
	
	
	
}
