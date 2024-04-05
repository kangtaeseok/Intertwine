package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;

public class InsertUserRoomParam implements Serializable { // sql문 매핑용 vo 클래스
	private static final long serialVersionUID = 4172978735392065105L;
	
	private String userId;
    private UserRoomResource userRoomResource;
	
    public InsertUserRoomParam() {
		super();
	}

	public InsertUserRoomParam(String userId, UserRoomResource userRoomResource) {
		super();
		this.userId = userId;
		this.userRoomResource = userRoomResource;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public UserRoomResource getUserRoomResource() {
		return userRoomResource;
	}

	public void setUserRoomResource(UserRoomResource userRoomResource) {
		this.userRoomResource = userRoomResource;
	}

	@Override
	public String toString() {
		return "InsertUserRoomParam [userId=" + userId + ", userRoomResource=" + userRoomResource + "]";
	}
}
