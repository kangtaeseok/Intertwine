package org.edu.intertwine.user.model.dao;


import org.edu.intertwine.user.controller.UserController;
import org.edu.intertwine.user.model.vo.SocialLogin;
import org.edu.intertwine.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
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

	public int updatePwd(User user) {
		return sqlSessionTemplate.update("userMapper.updatePwd", user);
	}

	public User selectPhone(String phone) {
		return sqlSessionTemplate.selectOne("userMapper.selectPhone", phone);
	}

	public void updateSocial(User loginUser) {
		sqlSessionTemplate.update("userMapper.updateSocial", loginUser);
	}

	public String selectSocialType(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectSocialType", userId);
	}

	public void insertSocial(SocialLogin social) {
		sqlSessionTemplate.insert("userMapper.insertSocial", social);
		
	}

	public int updateUser(User user) {
		return sqlSessionTemplate.update("userMapper.updateUser", user);
	}

	public void updateUserTime(String userId) {
		sqlSessionTemplate.update("userMapper.updateUserTime", userId);
	}


	

	
}
