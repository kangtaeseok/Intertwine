package org.edu.intertwine.user.model.dao;


import org.edu.intertwine.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public User selectUser(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectUser",userId);
	}

	public int selectUserCount(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectUserCount",userId);
	}

	public int insertUser(User user) {
		return sqlSessionTemplate.insert("userMapper.insertUser", user);
	}


	public int selectuserPwd(String userPwd) {
		return sqlSessionTemplate.selectOne("userMapper.selectuserPwd", userPwd);
	}

	public User selectEmail(String email) {
		return sqlSessionTemplate.selectOne("userMapper.selectEmail", email);
	}
	
	
	public int selectEmailCount(String email) {
		return sqlSessionTemplate.selectOne("userMapper.selectEmailCount", email);
	}

	
}
