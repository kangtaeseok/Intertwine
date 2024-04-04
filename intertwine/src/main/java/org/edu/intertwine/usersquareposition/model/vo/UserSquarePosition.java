package org.edu.intertwine.usersquareposition.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserSquarePosition implements Serializable {
	private static final long serialVersionUID = 1426686537398936266L;
	
	private String userId; // 사용자 ID
	private int userPositionX; // 사용자 캐릭터 X좌표
	private int userPositionY; // 사용자 캐릭터 Y좌표
	private int userStauts; //  사용자 로그인 상태 (0:오프라인, 1:온라인)
	
	public UserSquarePosition() {
		super();
	}

	public UserSquarePosition(String userId, int userPositionX, int userPositionY, int userStauts) {
		super();
		this.userId = userId;
		this.userPositionX = userPositionX;
		this.userPositionY = userPositionY;
		this.userStauts = userStauts;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getUserStauts() {
		return userStauts;
	}

	public void setUserStauts(int userStauts) {
		this.userStauts = userStauts;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserSquarePosition [userId=" + userId + ", userPositionX=" + userPositionX + ", userPositionY="
				+ userPositionY + ", userStauts=" + userStauts + "]";
	}

}
