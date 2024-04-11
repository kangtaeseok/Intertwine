package org.edu.intertwine.friend.model.vo;

public class friendProfile implements java.io.Serializable{

	private static final long serialVersionUID = 366293259350046918L;
	private String userId;
	private String friendId;
	private String status;
	private String profileDraft;
	public friendProfile() {
		super();
	
	
}
	@Override
	public String toString() {
		return "friendProfile [userId=" + userId + ", friendId=" + friendId + ", status=" + status + ", profileDraft="
				+ profileDraft + "]";
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProfileDraft() {
		return profileDraft;
	}
	public void setProfileDraft(String profileDraft) {
		this.profileDraft = profileDraft;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public friendProfile(String userId, String friendId, String status, String profileDraft) {
		super();
		this.userId = userId;
		this.friendId = friendId;
		this.status = status;
		this.profileDraft = profileDraft;
	}
}
