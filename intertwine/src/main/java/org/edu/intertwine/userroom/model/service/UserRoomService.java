package org.edu.intertwine.userroom.model.service;

import java.util.ArrayList;

import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.edu.intertwine.userroom.model.vo.UserRoomResource;

public interface UserRoomService {
	
	UserRoom selectUserRoomFirst(String userId);
	
	UserRoom selectUserRoom(String userId);
	
	ArrayList<UserRoomResource> selectAllRoomResource();

	int updateUserRoom(UserRoom userRoom);
	
	int insertUserRoomFirst(String userId);
	
	int insertUserRoom(InsertUserRoomParam insertUserRoomParam);
	
	int deleteUserRoom(String userId);

}
