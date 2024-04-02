package org.edu.intertwine.friend.model.service;

import java.util.ArrayList;

import org.edu.intertwine.friend.model.dao.FriendDao;
import org.edu.intertwine.friend.model.vo.Friend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("friendService")
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao friendDao;

	@Override
	public int insertFollowing(Friend friend) {
		 return friendDao.insertFollowing(friend);

	}

	@Override
	public int countFollowing(String userId) {
		return friendDao.countFollowing(userId);
	}

	@Override
	public int countFollowers(String userId) {
		return friendDao.countFollowers(userId);
	}

	@Override
	public void deleteFollowing(Friend friend) {
		friendDao.deleteFollowing(friend);

	}

	@Override
	public void blockFollowing(Friend friend) {
		friendDao.blockFollowing(friend);

	}

	
	  @Override public ArrayList<Friend> searchFollowing(Friend friend) { return
	  friendDao.searchFollowing(friend);
	  
	  }

	@Override
	public ArrayList<Friend> FollowingList(String userId) {
		return friendDao.FollowingList(userId);
	}
	
	
	 
	
}




























