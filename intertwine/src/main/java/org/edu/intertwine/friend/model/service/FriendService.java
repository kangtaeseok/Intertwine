package org.edu.intertwine.friend.model.service;

import java.util.ArrayList;

import org.edu.intertwine.friend.model.vo.Friend;

public interface FriendService {

	int insertFollowing(Friend friend);

	int selectCountFollowing(String userId);

	int selectCountFollowers(String userId);

	int deleteFollowing(Friend friend);

	int blockFollowing(Friend friend);

	ArrayList<Friend> selectSearchFollowing(Friend friend);

	ArrayList<Friend> selectFollowingList(String userId);

	ArrayList<Friend> selectFollowerList(String userId);

	ArrayList<Friend> selectSearchFollower(Friend friend);

	ArrayList<Friend> blockedList(String userId);

	int countBlocks(String userId);

	int blockFollower(Friend friend);
	
	int selectFollowing(Friend friend);
	
	int selectFollower(Friend friend);

	String selectFollowingId(Friend friend);

	String selectFollowerId(Friend friend);


	

}
