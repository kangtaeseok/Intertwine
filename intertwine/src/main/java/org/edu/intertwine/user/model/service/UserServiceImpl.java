package org.edu.intertwine.user.model.service;


import org.edu.intertwine.user.controller.UserController;
import org.edu.intertwine.user.model.dao.UserDao;
import org.edu.intertwine.user.model.vo.MyPage;
import org.edu.intertwine.user.model.vo.SocialLogin;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserService")
public class UserServiceImpl implements UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDao userDao;

	@Override
	public User selectUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public int selectUserCount(String userId) {
		return userDao.selectUserCount(userId);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public User selectEmail(String email) {
		return userDao.selectEmail(email);
	}

	@Override
	public int selectEmailCount(String email) {
		return userDao.selectEmailCount(email);
	}
	
	@Override
	public int selectuserPwd(String userPwd) {
		return userDao.selectuserPwd(userPwd);
	}

	@Override
	public int updatePwd(User user) {
		return userDao.updatePwd(user);
	}

	@Override
	public User selectPhone(String phone) {
		return userDao.selectPhone(phone);
	}

	@Override
	public void updateSocial(User loginUser) {
		userDao.updateSocial(loginUser);
	}

	@Override
	public String selectSocialType(String userId) {
		return userDao.selectSocialType(userId);
	}

	@Override
	public void insertSocial(SocialLogin social) {
		userDao.insertSocial(social);
		
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	
	
	/* 마이페이지 */
	@Override
	public void updateUserTime(MyPage mypage) {
		userDao.updateUserTime(mypage);
		
	}

	@Override
	public void insertMyPage(String userId) {
		userDao.insertMyPage(userId);
		
		
	}

	@Override
	public String selectUserTime(String userId) {
		return userDao.selectUserTime(userId);
	}

	@Override
	public MyPage selectMyPage(String userId) {
		return userDao.selectMyPage(userId);
	}

	

	@Override
	public String selectUserNickname(String userId) {
		return userDao.selectUserNickname(userId);
	}

	@Override
	public void updateUserNickname(User user) {
		userDao.updateUserNickname(user);
	}

	
	
	
	
	
}
