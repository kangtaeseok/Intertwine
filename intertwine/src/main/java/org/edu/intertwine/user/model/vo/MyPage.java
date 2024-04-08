package org.edu.intertwine.user.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class MyPage implements Serializable {
	private static final long serialVersionUID = -4658818793439735394L;
	private String userId;
	private java.sql.Date userUseTime;
	private String userTime;
	private String statusMessage;
	private String profile;
	private String profileDraft;
	
	
	@Override
	public String toString() {
		return "MyPage [userId=" + userId + ", userUseTime=" + userUseTime + ", userTime=" + userTime
				+ ", statusMessage=" + statusMessage + ", profile=" + profile + ", profileDraft=" + profileDraft + "]";
	}


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


	public String getUserTime() {
		return userTime;
	}


	public void setUserTime(String userTime) {
		this.userTime = userTime;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public MyPage(String userId, Date userUseTime, String userTime, String statusMessage, String profile,
			String profileDraft) {
		super();
		this.userId = userId;
		this.userUseTime = userUseTime;
		this.userTime = userTime;
		this.statusMessage = statusMessage;
		this.profile = profile;
		this.profileDraft = profileDraft;
	}
	
	
	
	
}
