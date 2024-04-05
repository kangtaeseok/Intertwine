package org.edu.intertwine.userroom.model.service;

import org.edu.intertwine.userroom.model.dao.UserRoomDao;
import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;
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
	public int insertUserRoomFirst(String userId) {
		return userRoomDao.insertUserRoomFirst(userId);
	}

	@Override
	public int insertUserRoom(InsertUserRoomParam insertUserRoomParam) {
		return userRoomDao.insertUserRoom(insertUserRoomParam);
	}

	@Override
	public int deleteUserRoom(String userId) {
		return userRoomDao.deleteUserRoom(userId);
	}
}
