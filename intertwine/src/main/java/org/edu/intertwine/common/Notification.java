package org.edu.intertwine.common;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

public class Notification implements Serializable {

	private static final long serialVersionUID = -1285347580993800145L;
	private int notifyId;
	private String userId;
	private int type;
	private java.sql.Date notifyTime;
	private String notifyContent;
	private String notifyCheck;
	@Override
	public String toString() {
		return "Notification [notifyId=" + notifyId + ", userId=" + userId + ", type=" + type + ", notifyTime="
				+ notifyTime + ", notifyContent=" + notifyContent + ", notifyCheck=" + notifyCheck + "]";
	}
	public int getNotifyId() {
		return notifyId;
	}
	public void setNotifyId(int notifyId) {
		this.notifyId = notifyId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public java.sql.Date getNotifyTime() {
		return notifyTime;
	}
	public void setNotifyTime(java.sql.Date notifyTime) {
		this.notifyTime = notifyTime;
	}
	public String getNotifyContent() {
		return notifyContent;
	}
	public void setNotifyContent(String notifyContent) {
		this.notifyContent = notifyContent;
	}
	public String getNotifyCheck() {
		return notifyCheck;
	}
	public void setNotifyCheck(String notifyCheck) {
		this.notifyCheck = notifyCheck;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Notification(int notifyId, String userId, int type, Date notifyTime, String notifyContent,
			String notifyCheck) {
		super();
		this.notifyId = notifyId;
		this.userId = userId;
		this.type = type;
		this.notifyTime = notifyTime;
		this.notifyContent = notifyContent;
		this.notifyCheck = notifyCheck;
	}
	public Notification() {
		super();
	}

	
}

