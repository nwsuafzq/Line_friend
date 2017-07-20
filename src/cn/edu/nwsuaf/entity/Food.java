package cn.edu.nwsuaf.entity;

/**
 * @author 刘志伟
 *
 * 2017-6-14
 */
public class Food {
	private int id;
	private String producer;//生产商
	private String produce_date; //生产日期
	private int expiration_date;//保质期
	private int storge;//库存
	private String category;//分类
	private String specification;//规格
	private int product_id;   //商品id
	private Product product;
	
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getProduce_date() {
		return produce_date;
	}
	public void setProduce_date(String produceDate) {
		produce_date = produceDate;
	}
	public int getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(int expirationDate) {
		expiration_date = expirationDate;
	}
	public int getStorge() {
		return storge;
	}
	public void setStorge(int storge) {
		this.storge = storge;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
}
