package org.edu.intertwine.friend.model.vo;

public class Friend implements java.io.Serializable{
	private static final long serialVersionUID = -6396073550074695676L;
	
	private String userId;
	private String blockId;
	private String friendId;
	private int notificationStatus;
	private String status;
	
	public Friend() {
		super();
	}

	public Friend(String userId, String blockId, String friendId, int notificationStatus, String status) {
		super();
		this.userId = userId;
		this.blockId = blockId;
		this.friendId = friendId;
		this.notificationStatus = notificationStatus;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBlockId() {
		return blockId;
	}

	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}

	public String getFriendId() {
		return friendId;
	}

	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}

	public int getNotificationStatus() {
		return notificationStatus;
	}

	public void setNotificationStatus(int notificationStatus) {
		this.notificationStatus = notificationStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Friend [userId=" + userId + ", blockId=" + blockId + ", friendId=" + friendId + ", notificationStatus="
				+ notificationStatus + ", status=" + status + "]";
	}
	
	
	

}
