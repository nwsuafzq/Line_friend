/**
 * author 刘志伟
 * 2017-6-23
 */
package cn.edu.nwsuaf.dao;

import java.util.List;

import cn.edu.nwsuaf.entity.Cart;
import cn.edu.nwsuaf.entity.Cart2;
import cn.edu.nwsuaf.entity.Product;

/**
 * @author 刘志伟
 *
 * 2017-6-23
 */
public interface CartDao {
	//加入购物车
	public void addCart(Cart cart);
	
	//查询此用户所有购物车中商品
	public List<Cart> findAllProductByUserId(int userid);
	
	//不想要了，从购物重删除
	public void delterCartItem(int id);//购物车item中的id
	
	//从购物车表中查询是否之前加入该商品
	public int findProductByIdInCart(int id);
	
	
	

}
