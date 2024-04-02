package org.edu.intertwine.friend.model.vo;

public class searchFriend {
	private String userId;
	private String friendId;
	public searchFriend(String userId, String friendId) {
		super();
		this.userId = userId;
		this.friendId = friendId;
	}
	public searchFriend() {
		super();
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	@Override
	public String toString() {
		return "searchFriend [userId=" + userId + ", friendId=" + friendId + "]";
	}
	
	
}
