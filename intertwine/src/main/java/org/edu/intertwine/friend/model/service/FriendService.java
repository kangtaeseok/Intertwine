package org.edu.intertwine.friend.model.service;

import java.util.ArrayList;

import org.edu.intertwine.friend.model.vo.Friend;

public interface FriendService {

	int insertFollowing(Friend friend);

	int countFollowing(String userId);

	int countFollowers(String userId);

	int deleteFollowing(Friend friend);

	int blockFollowing(Friend friend);

	ArrayList<Friend> searchFollowing(Friend friend);

	ArrayList<Friend> FollowingList(String userId);

	ArrayList<Friend> FollowerList(String userId);

	ArrayList<Friend> searchFollower(Friend friend);

	ArrayList<Friend> blockedList(String userId);

	int countBlocks(String userId);

	int blockFollower(Friend friend);
	
	int selectFollowing(Friend friend);
	
	int selectFollower(Friend friend);

	String selectFollowingId(Friend friend);

	String selectFollowerId(Friend friend);

	/*
	 * //나를 차단한/내가 차단한 차단계정 목록(팔로잉) ArrayList<String> blockedAllList(String userId);
	 */
	

}
