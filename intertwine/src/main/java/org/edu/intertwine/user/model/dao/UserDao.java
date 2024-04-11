package org.edu.intertwine.user.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.common.Notification;
import org.edu.intertwine.user.controller.UserController;
import org.edu.intertwine.user.model.vo.MyPage;
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

	public void updateUserTime(MyPage mypage) {
		sqlSessionTemplate.update("userMapper.updateUserTime", mypage);
	}

	public void insertMyPage(String userId) {
		sqlSessionTemplate.insert("userMapper.insertMyPage", userId);
		
	}

	public String selectUserTime(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectUserTime", userId);
	}

	public MyPage selectMyPage(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectMyPage", userId);
	}


	public String selectUserNickname(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectUserNickname", userId);
	}

	public void updateUserNickname(User user) {
		sqlSessionTemplate.update("userMapper.updateUserNickname", user);		
	}

	public Notification selectNotify(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectNotify", userId);
	}

	public int updateCustonAlarm(Notification notify) {
		return sqlSessionTemplate.update("userMapper.updateCustonAlarm", notify);
		
	}




	//알림
	public void insertAlarm(String userId) {
		sqlSessionTemplate.insert("userMapper.insertAlarm", userId);		
	}
	public void updateDayTime(String userId) {
		sqlSessionTemplate.update("userMapper.updateDayTime", userId);	
	}
	public void insertNotify(String userId) {
		sqlSessionTemplate.insert("userMapper.insertNotify", userId);
		
	}

	
	//탈퇴
	public void insertUserStop(String userId) {
		sqlSessionTemplate.update("userMapper.insertUserStop", userId);		
	}

	public void updateUserdisable(String userId) {
		sqlSessionTemplate.update("userMapper.updateUserdisable", userId);		
	}

	//휴면관리
	public int selectAccountStatus(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectAccountStatus", userId);		
	
	}

	public void updateUserStatus(String email) {
		sqlSessionTemplate.update("userMapper.updateUserStatus", email);		
		
	}

	public void updateUserStop(String userId) {
		sqlSessionTemplate.update("userMapper.updateUserStop", userId);	
		
	}

	public int selectAllUserCount() {
		return sqlSessionTemplate.selectOne("userMapper.selectAllUserCount");
		
	}

	public int updateMyPage(MyPage mypage) {
		return sqlSessionTemplate.update("userMapper.updateMyPage", mypage);
	}

	
}
