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
	public int selectCountFollowing(String userId) {
		return friendDao.selectCountFollowing(userId);
	}

	@Override
	public int selectCountFollowers(String userId) {
		return friendDao.selectCountFollowers(userId);
	}

	@Override
	public int deleteFollowing(Friend friend) {
		return friendDao.deleteFollowing(friend);

	}

	@Override
	public int blockFollowing(Friend friend) {
		return friendDao.blockFollowing(friend);
		

	}

	
	  @Override public ArrayList<Friend> selectSearchFollowing(Friend friend) { return
	  friendDao.selectSearchFollowing(friend);
	  
	  }

	@Override
	public ArrayList<Friend> selectFollowingList(String userId) {
		return friendDao.selectFollowingList(userId);
	}

	@Override
	public ArrayList<Friend> selectFollowerList(String userId) {
		return friendDao.selectFollowerList(userId);
	}

	@Override
	public ArrayList<Friend> selectSearchFollower(Friend friend) {
		return friendDao.selectSearchFollower(friend);
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
	
	@Override
	public int selectFollowing(Friend friend) {
		return friendDao.selectFollowing(friend);
	}
	
	@Override
	public int selectFollower(Friend friend) {
		return friendDao.selectFollower(friend);
	}

	@Override
	public String selectFollowingId(Friend friend) {
		return friendDao.selectFollowingId(friend);
	}

	@Override
	public String selectFollowerId(Friend friend) {
		return friendDao.selectFollowerId(friend);
	}
	
	
	
	
	 
	
}




























