package cn.edu.nwsuaf.dao;

import cn.edu.nwsuaf.entity.Admin;

public interface AdminDao {
	public Admin findByLogin1(String userName, String password); // 登录，查找admin和密码是否匹配
	
	
	public Admin findByUserName(String userName); // 根据email查找User是否存在


	public Admin findByLogin(Admin user);
}
