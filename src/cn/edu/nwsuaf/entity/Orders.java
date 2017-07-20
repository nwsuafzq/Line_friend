package cn.edu.nwsuaf.entity;

public class Orders {
   private int id;
   private int user_id;
   private String order_time;
   private String price_amount;
   private String address_id;
   private String status;

@Override
public String toString() {
	return "Orders [address_id=" + address_id + ", id=" + id + ", order_time="
			+ order_time + ", price_amount=" + price_amount + ", status="
			+ status + ", user_id=" + user_id + "]";
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

public String getOrder_time() {
	return order_time;
}

public void setOrder_time(String orderTime) {
	order_time = orderTime;
}

public String getPrice_amount() {
	return price_amount;
}

public void setPrice_amount(String priceAmount) {
	price_amount = priceAmount;
}

public String getAddress_id() {
	return address_id;
}

public void setAddress_id(String addressId) {
	address_id = addressId;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public Orders() {
	super();
	// TODO Auto-generated constructor stub
}



}
