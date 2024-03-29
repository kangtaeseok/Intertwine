package org.edu.intertwine.user.model.service;


import org.edu.intertwine.user.model.dao.UserDao;
import org.edu.intertwine.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserService")
public class UserServiceImpl implements UserService {

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


	
	
	
	
	
}
