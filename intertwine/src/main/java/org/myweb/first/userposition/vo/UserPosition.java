package org.myweb.first.userposition.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserPosition implements Serializable {
	private static final long serialVersionUID = 1426686537398936266L;
	private String userId;
	private int userStauts;
	private int userPositionX;
	private int userPositionY;
	
	public UserPosition() {
		super();
	}
	
	public UserPosition(String userId, int userStauts, int userPositionX, int userPositionY) {
		super();
		this.userId = userId;
		this.userStauts = userStauts;
		this.userPositionX = userPositionX;
		this.userPositionY = userPositionY;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserStauts() {
		return userStauts;
	}
	public void setUserStauts(int userStauts) {
		this.userStauts = userStauts;
	}
	public int getUserPositionX() {
		return userPositionX;
	}
	public void setUserPositionX(int userPositionX) {
		this.userPositionX = userPositionX;
	}
	public int getUserPositionY() {
		return userPositionY;
	}
	public void setUserPositionY(int userPositionY) {
		this.userPositionY = userPositionY;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "UserPosition [userId=" + userId + ", userStauts=" + userStauts + ", userPositionX=" + userPositionX
				+ ", userPositionY=" + userPositionY + "]";
	}
	
}
