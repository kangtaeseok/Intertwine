package org.edu.intertwine.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserStop implements Serializable{

	private static final long serialVersionUID = 1041546935237765837L;
	private String userId;
	private java.sql.Date stopDate;
	public UserStop(String userId, Date stopDate) {
		super();
		this.userId = userId;
		this.stopDate = stopDate;
	}
	@Override
	public String toString() {
		return "UserStop [userId=" + userId + ", stopDate=" + stopDate + "]";
	}
	public UserStop() {
		super();
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public java.sql.Date getStopDate() {
		return stopDate;
	}
	public void setStopDate(java.sql.Date stopDate) {
		this.stopDate = stopDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
