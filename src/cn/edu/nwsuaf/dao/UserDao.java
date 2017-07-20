package cn.edu.nwsuaf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import cn.edu.nwsuaf.entity.User;

/**
 * 用户DAO类
 * @author 张琼 2017-6-13
 */
public interface UserDao {

	public void register(User user); // 注册

	public User emailIsRegist(String email); // 判断邮箱是否已被注册

	public String emailVerifyCode(String email); // 取出邮箱验证码

	public void emailVerifySuccess(String email); // 通过邮箱验证后将is_email_verify改为“y”

	public User findByLogin(String email, String password); // 登录，查找email和密码是否匹配

	public User findByEmail(String email); // 根据email查找User是否存在

	public String isEmailVerify(String email); // 判断账号是否已经验证过邮箱了 y||n
	
	public void updateLastLogin(User user);	//每次登陆都更新最后一次登录时间和IP

	// public void updateUserInfo(User user);

	// public void register(String email, String password); //注册
	
	public int findByEmailToId(String email);//通过email获取用户id
	
	public User findUserById(int id);//根据id 查询用户
	
	public void editUserInfo(User user);//编辑个人信息
	
	public void updateEmailVerifyCodeByEmail(@Param("email")String email,@Param("email_verify_code")String email_verify_code);//更新邮箱验证码，用在邮箱验证页面重新获取邮箱验证码
	
	//@Qian
	public List<User> findAllUser();//查询所有用户
	/*public User findUserByEmail(String email);*/
	public List<User> findUserBySex(String sex);//按条件查询-性别
	public List<User> findUserByAge(int age);//按年龄查询用户
	public List<User> findUserByNickName(String nickName);//按昵称查询
	public List<User> findUserByEmail(String email); // 
	public List<User> findUserByIdList(int id);//根据id 查询用户
	public void deleteUserById(int id);
	public void UpdateInfo(User user);
}
