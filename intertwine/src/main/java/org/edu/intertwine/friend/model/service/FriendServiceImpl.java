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
	public int deleteFollowing(Friend friend) {
		return friendDao.deleteFollowing(friend);

	}

	@Override
	public int blockFollowing(Friend friend) {
		return friendDao.blockFollowing(friend);
		

	}

	
	  @Override public ArrayList<Friend> searchFollowing(Friend friend) { return
	  friendDao.searchFollowing(friend);
	  
	  }

	@Override
	public ArrayList<Friend> FollowingList(String userId) {
		return friendDao.FollowingList(userId);
	}

	@Override
	public ArrayList<Friend> FollowerList(String userId) {
		return friendDao.FollowerList(userId);
	}

	@Override
	public ArrayList<Friend> searchFollower(Friend friend) {
		return friendDao.searchFollower(friend);
	}

	@Override
	public ArrayList<Friend> blockedList(String userId) {
		return friendDao.blockedList(userId);
	}

	@Override
	public int countBlocks(String userId) {
		return  friendDao.countBlocks(userId);
	}

	@Override
	public int blockFollower(Friend friend) {
		return friendDao.blockFollower(friend);
	}
	
	
	
	
	 
	
}




























