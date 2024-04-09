package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;
import java.util.List;

public class InsertUserRoomParam implements Serializable { // sql문 매핑용 vo 클래스
	private static final long serialVersionUID = 4172978735392065105L;
	
	private String userId;
    private List<UserRoomResource> items;
	
    public InsertUserRoomParam() {
		super();
	}

	public InsertUserRoomParam(String userId, List<UserRoomResource> items) {
		super();
		this.userId = userId;
		this.items = items;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<UserRoomResource> getItems() {
		return items;
	}

	public void setItems(List<UserRoomResource> items) {
		this.items = items;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "InsertUserRoomParam [userId=" + userId + ", items=" + items + "]";
	}

	
	
}
