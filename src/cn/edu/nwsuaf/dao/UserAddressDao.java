package cn.edu.nwsuaf.dao;

import cn.edu.nwsuaf.entity.User;
import cn.edu.nwsuaf.entity.UserAddress;

/**
 * @author 刘志伟
 * 
 * 2017-6-14
 */
public interface UserAddressDao {
	public void addUserAddress(UserAddress address);//添加用户地址
	public UserAddress updateAddress(int id);//根地址id跟新用户此地址
	public void deleteAddress(int id);//根地址id删除用户此地址
	public User findUserAddressById(int id);//通过用户id查询所有的用户地址，返回用户，用户有list<address>属性通过user来获取address
	//public UserAddress findByAddressId(int addressId) ;		
}
