package org.edu.intertwine.userroom.model.service;

import org.edu.intertwine.userroom.model.dao.UserRoomDao;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userRoomService")
public class UserRoomServiceImpl implements UserRoomService {
	@Autowired
	   private UserRoomDao userRoomDao;
	
	@Override
	public UserRoom selectUserRoom(String userID) {
		return userRoomDao.selectUserRoom(userID);
	}

}
