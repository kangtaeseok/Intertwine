package org.edu.intertwine.friend.model.service;

import java.util.ArrayList;

import org.edu.intertwine.friend.model.vo.Friend;

public interface FriendService {

	int insertFollowing(Friend friend);

	int countFollowing(String userId);

	int countFollowers(String userId);

	int deleteFollowing(Friend friend);

	void blockFollowing(Friend friend);

	ArrayList<Friend> searchFollowing(Friend friend);

	ArrayList<Friend> FollowingList(String userId);

	ArrayList<Friend> FollowerList(String userId);

	ArrayList<Friend> searchFollower(Friend friend);

	/*
	 * //나를 차단한/내가 차단한 차단계정 목록(팔로잉) ArrayList<String> blockedAllList(String userId);
	 */
	

}
