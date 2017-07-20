package cn.edu.nwsuaf.entity;

/**
 * @author 刘志伟
 * 
 * 2017-6-23
 */


public class Cart {
	private int id; //购物车编号
	private Product product;  
	private int user_id;
    private int product_count;//数量
      
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int productCount) {
		product_count = productCount;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", product=" + product + ", product_count="
				+ product_count + ", user_id=" + user_id + "]";
	}
	
	
    
   
}
