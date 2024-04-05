package org.edu.intertwine.user.model.vo;

import java.sql.Date;

public class MyPage {
	private String userId;
	private java.sql.Date userUseTime;
	private String statusMessage;
	private String profile;
	private String profileDraft;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public java.sql.Date getUserUseTime() {
		return userUseTime;
	}
	public void setUserUseTime(java.sql.Date userUseTime) {
		this.userUseTime = userUseTime;
	}
	public String getStatusMessage() {
		return statusMessage;
	}
	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getProfileDraft() {
		return profileDraft;
	}
	public void setProfileDraft(String profileDraft) {
		this.profileDraft = profileDraft;
	}
	@Override
	public String toString() {
		return "MyPage [userId=" + userId + ", userUseTime=" + userUseTime + ", statusMessage=" + statusMessage
				+ ", profile=" + profile + ", profileDraft=" + profileDraft + "]";
	}
	public MyPage() {
		super();
	}
	public MyPage(String userId, Date userUseTime, String statusMessage, String profile, String profileDraft) {
		super();
		this.userId = userId;
		this.userUseTime = userUseTime;
		this.statusMessage = statusMessage;
		this.profile = profile;
		this.profileDraft = profileDraft;
	}
	
	
}
