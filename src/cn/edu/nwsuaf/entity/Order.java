package cn.edu.nwsuaf.entity;

/**
 * 
 * 订单
 * 
 * @author 吴思颖
 * 
 */
public class Order {
	private String id;// 自增主键
	private int user_id;
	private String status;
	private String order_time;
	private String address_id;
	private String price_amount;
	private String message;
	
	public String getPrice_amount() {
		return price_amount;
	}
	public void setPrice_amount(String priceAmount) {
		price_amount = priceAmount;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String orderTime) {
		order_time = orderTime;
	}
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String addressId) {
		address_id = addressId;
	}
	@Override
	public String toString() {
		return "Order [address_id=" + address_id + ", id=" + id + ", message="
				+ message + ", order_time=" + order_time + ", price_amount="
				+ price_amount + ", status=" + status + ", user_id=" + user_id
				+ "]";
	}
	
	
	
}
