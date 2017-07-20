package cn.edu.nwsuaf.dao;

import java.util.List;
import cn.edu.nwsuaf.entity.Item;
import cn.edu.nwsuaf.entity.Order;
import cn.edu.nwsuaf.entity.UserAddress;

public interface OrderDao {
	
	/*后台功能接口*/
	//public void addUserOrder(UserAddress address);//添加用户地址
	public void updateOrder(String id,String status);//根据订单id修改订单状态
	public void deleteOrder(String id);//根据订单ID删除订单
	public List<Order> findAllOrder();//查询所有订单并显示
	public List<Order> findOrderByorder_id(String id);//根据订单id 查询订单
	public List<Order> findOrderByorder_time(String user_time);//根据下单时间 查询订单
	public List<Order> findOrderByuser_id(int user_id);//根据用户id 查询订单
	public List<UserAddress> findAddressById(String id);//根据地址id 查询订单
	public List<Item> findItemById(String order_id);//根据订单id 查询订单
	/*前台功能接口*/
	
	public List<Order> findUserOrder();
	public List<Order> findUserOrderByUserId(int user_id);//通过用户ID获取此用户的所有的订单
	public String deteleByProductId(int orderId);//删除订单单项
	public void insertIntoOrder(Order order);//插入订单

   
}
