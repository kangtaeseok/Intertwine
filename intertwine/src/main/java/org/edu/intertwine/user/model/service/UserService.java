package org.edu.intertwine.user.model.service;

import org.edu.intertwine.user.model.vo.User;

public interface UserService {

	User selectUser(String userId);

	int selectUserCount(String userId);

	int insertUser(User user);

	int selectuserPwd(String userPwd);

	int selectEmailCount(String email);

	int updatePwd(User user);
	
	User selectEmail(String email);

	User selectPhone(String phone);

	void updateSocial(User loginUser);



}
