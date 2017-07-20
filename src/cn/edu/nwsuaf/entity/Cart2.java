/**
 * author 刘志伟
 * 2017-6-26
 */
package cn.edu.nwsuaf.entity;

import java.util.List;

/**
 * @author 刘志伟
 *
 * 2017-6-26
 */
public class Cart2 {
	private int id;
	private int user_id;
	private int product_count;
	private List<Product> prodcutList;//一对多 一个用户对一个购物车，一个购物车对应多个购物项目
	
	
	@Override
	public String toString() {
		return "Cart2 [count=" + product_count + ", id=" + id + ", prodcutList="
				+ prodcutList + ", user_id=" + user_id + "]";
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public int getCount() {
		return product_count;
	}
	public void setCount(int count) {
		this.product_count = count;
	}
	public List<Product> getProdcutList() {
		return prodcutList;
	}
	public void setProdcutList(List<Product> prodcutList) {
		this.prodcutList = prodcutList;
	}
	
	
	

}
