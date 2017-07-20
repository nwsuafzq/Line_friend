/**
 * author 刘志伟
 * 2017-6-26
 */
package cn.edu.nwsuaf.entity;

/**
 * @author 刘志伟
 *
 * 2017-6-26
 */
//订单详情类
public class OrderDetails {
	private int id;
	private Order order;
	private Product product;
	private String product_name;
	private String price;
	private String product_num;
	private String amount;
	
	
	
	@Override
	public String toString() {
		return "OrderDetails [amount=" + amount + ", id=" + id + ", order="
				+ order + ", price=" + price + ", product=" + product
				+ ", product_name=" + product_name + ", product_num="
				+ product_num + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String productNum) {
		product_num = productNum;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	
	
	
	
	
	
	
	
	

}
