package cn.edu.nwsuaf.dao;

import java.util.List;
import cn.edu.nwsuaf.entity.Product;

/**
 * 根据分类搜索商品的DAO
 * @author 张琼
 * 2017-6-23
 */
public interface CategorySearchDao {
	
	
	//public List findFoodByCategory(String category);
	
	//public int findProductIdByFoodId(int id);
	
	//public Product findProductByProductId(int product_id);

	public List<Product> findProductsByKeywords(String keywords);
	

}
