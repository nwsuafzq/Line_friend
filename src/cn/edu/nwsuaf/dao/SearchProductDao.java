package cn.edu.nwsuaf.dao;

import java.util.List;

import cn.edu.nwsuaf.entity.Product;

/*
 * 搜索商品
 */
public interface SearchProductDao {
	//public Product findProductByName(String product_name); //根据商品名查询商品 返回商品对象
	public List<Product> findProductsByName(String product_name);   //根据商品名查询商品(模糊搜索) 返回List
	//public List<Product> findProductsByName(Product p);
	
	public List<Product> findProductsByPrice(double pricelow,double pricehigh);
	
//	public List<Product> findProductsByWeight(double weightlow,double weighthigh);
}
