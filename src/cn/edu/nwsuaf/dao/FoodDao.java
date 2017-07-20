package cn.edu.nwsuaf.dao;

import java.util.List;

import cn.edu.nwsuaf.entity.Food;

/**
 * @author 张琼
 * 2017-6-28
 */
public interface FoodDao {
	
	public Food findFoodByProductId(int product_id); //根据商品id查询商品详情
	
	public List<Food> findAllFood();
	
	public void addFood(Food food);//
	
	/* 陈一婷 */
	public void updateFoodInfo(Food food);
}
