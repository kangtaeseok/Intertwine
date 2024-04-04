package org.edu.intertwine.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SocialLogin implements Serializable{
	private static final long serialVersionUID = 380970524937448964L;
	
	private String userId;
	private String type;
	private java.sql.Date userTime;
	public String getUserId() {
		return userId;
	}
	
	public SocialLogin() {
		
	}
	
	public SocialLogin(String userId, String type, Date userTime) {
		super();
		this.userId = userId;
		this.type = type;
		this.userTime = userTime;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public java.sql.Date getUserTime() {
		return userTime;
	}
	public void setUserTime(java.sql.Date userTime) {
		this.userTime = userTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SocialLogin [userId=" + userId + ", type=" + type + ", userTime=" + userTime + "]";
	}
	
	

}
