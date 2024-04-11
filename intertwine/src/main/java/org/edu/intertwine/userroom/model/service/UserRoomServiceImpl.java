package org.edu.intertwine.userroom.model.service;

import java.util.ArrayList;

import org.edu.intertwine.userroom.model.dao.UserRoomDao;
import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.edu.intertwine.userroom.model.vo.UserRoomResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userRoomService")
public class UserRoomServiceImpl implements UserRoomService {
	@Autowired
	private UserRoomDao userRoomDao;

	@Override
	public UserRoom selectUserRoomFirst(String userId) {
		return userRoomDao.selectUserRoomFirst(userId);
	}

	@Override
	public UserRoom selectUserRoom(String userId) {
		return userRoomDao.selectUserRoom(userId);
	}

	@Override
	public ArrayList<UserRoomResource> selectAllRoomResource() {
		return userRoomDao.selectAllRoomResource();
	}

	@Override
	public int updateUserRoom(UserRoom userRoom) {
		return userRoomDao.updateUserRoom(userRoom);
	}

	@Override
	public int insertUserRoomFirst(String userId) {
		return userRoomDao.insertUserRoomFirst(userId);
	}

	@Override
	public void insertUserRoom(String userId, UserRoomResource item) {
		userRoomDao.insertUserRoom(userId, item);
	}

	@Override
	public int deleteUserRoom(String userId) {
		return userRoomDao.deleteUserRoom(userId);
	}

}
