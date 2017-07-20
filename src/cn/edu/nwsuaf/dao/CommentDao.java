package cn.edu.nwsuaf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nwsuaf.entity.Comment;

/**
 * 评论DAO
 * @author 张琼
 * 2017-6-26
 */
public interface CommentDao {
	
	//public Comment findCommentByProductId(int id);
	
	public List<Comment> findCommentsByProductId(int product_id);	//根据商品ID查询对应的评论列表
		
	public void addComment(@Param("content")String content,@Param("email")String email,@Param("send_time")String send_time,@Param("upvote")String upvote,@Param("product_id")int product_id); //增加评论

}
