package org.edu.intertwine.user.model.service;

import org.edu.intertwine.user.model.vo.User;

public interface UserService {

	User selectUser(String userId);

	int selectUserCount(String userId);

	int insertUser(User user);

	User selectEmail(String email);

	int selectuserPwd(String userPwd);

	int selectEmailCount(String email);



}
