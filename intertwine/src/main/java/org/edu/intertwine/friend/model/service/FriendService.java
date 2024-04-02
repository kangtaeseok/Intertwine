package org.edu.intertwine.friend.model.service;

import java.util.ArrayList;

import org.edu.intertwine.friend.model.vo.Friend;

public interface FriendService {

	int insertFollowing(Friend friend);

	int countFollowing(String userId);

	int countFollowers(String userId);

	void deleteFollowing(Friend friend);

	void blockFollowing(Friend friend);

	ArrayList<Friend> searchFollowing(Friend friend);

	ArrayList<Friend> FollowingList(String userId);
	

}
