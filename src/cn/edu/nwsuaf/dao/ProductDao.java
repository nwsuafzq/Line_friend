package cn.edu.nwsuaf.dao;

import java.util.List;

import cn.edu.nwsuaf.entity.Favourite;
import cn.edu.nwsuaf.entity.Product;

/**
 * @author 张琼
 * 2017-6-30
 */
public interface ProductDao {
	public Product findProductById(int id);
	public List<Product> findAllProduct();	//home.jsp加载时动态显示商品
	
	/* 陈一婷 */
	public List<Product> findAllProduct1();
	public List<Product> findProductById1(int id);
	public List<Product> findProductByName(String name);
	public List<Product> findProductByCategory(String category);
	public List<Product> findProductByPrice(double price);
	public List<Product> findProductByAddTime(long addTime);
	
	public void addProduct(Product product);	//上架商品
	
	public void deleteProductById(int id);
	public void resumeProductById(int id);
	public void updateProductInfo(Product product);
	
	public void favorProduct(int product_id,String email,String product_name,double product_price,String product_pic);
	
	public List<Favourite> findFavouriteProByEmail(String email);
	
}
