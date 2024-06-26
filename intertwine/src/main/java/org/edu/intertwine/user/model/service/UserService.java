package org.edu.intertwine.user.model.service;

import java.util.List;

import org.edu.intertwine.common.Notification;
import org.edu.intertwine.user.model.vo.MyPage;
import org.edu.intertwine.user.model.vo.SocialLogin;
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

	String selectSocialType(String userId);

	void insertSocial(SocialLogin social);

	int updateUser(User user);

	/* 마이페이지 */
	void updateUserTime(MyPage mypage);

	void insertMyPage(String userId);

	String selectUserTime(String userId);

	MyPage selectMyPage(String userId);


	String selectUserNickname(String userId);

	void updateUserNickname(User user);


	void updateUserdisable(String userId);

	void insertUserStop(String userId);



	Notification selectNotify(String userId);
	int updateCustonAlarm(Notification notify);
	void insertAlarm(String userId);
	void updateDayTime(String userId);

	//휴면계정 관리
	int selectAccountStatus(String userId);

	void updateUserStatus(String email);

	void updateUserStop(String userId);

	int selectAllUserCount();

	int updateMyPage(MyPage mypage);


}
