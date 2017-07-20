package cn.edu.nwsuaf.entity;

public class Item {
	private int id; //订单详情编号
	private String order_id; 
	private int product_id;
	private String product_name;
	private double price;
	private int product_num;
	private double amount;
	public Item() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String orderId) {
		order_id = orderId;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String productName) {
		product_name = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int productNum) {
		product_num = productNum;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	@Override
	public String	 toString() {
		return "Item [amount=" + amount + ", id=" + id + ", order_id="
				+ order_id + ", price=" + price + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_num="
				+ product_num + "]";
	}
	
}
