package org.edu.intertwine.userroom.model.service;

import java.util.ArrayList;

import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;

public interface UserRoomService {
	
	UserRoom selectUserRoomFirst(String userId);
	
	UserRoom selectUserRoom(String userId);
	
	int insertUserRoomFirst(String userId);
	
	int insertUserRoom(InsertUserRoomParam insertUserRoomParam);
	
	int deleteUserRoom(String userId);

}
