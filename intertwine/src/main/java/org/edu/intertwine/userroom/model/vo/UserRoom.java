package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class UserRoom implements Serializable {
	private static final long serialVersionUID = -2317634193220268983L;

	private String userId; // 사용자 ID
	private String roomColor; // 방 테마색
	private int guestBookOpen; // 방명록 공개여부  0:공개, 1:비공개

	// 리소스 배치정보, 저장위치가 들어있는 리스트, 테이블 조인해서 저장할 필드
	private ArrayList<UserRoomResource> rList;

	public UserRoom() {
		super();
	}
	
	public UserRoom(String userId, String roomColor) {
		super();
		this.userId = userId;
		this.roomColor = roomColor;
	}

	public UserRoom(String userId, String roomColor, int guestBookOpen) {
		super();
		this.userId = userId;
		this.roomColor = roomColor;
		this.guestBookOpen = guestBookOpen;
	}

	public UserRoom(String userId, String roomColor, int guestBookOpen, ArrayList<UserRoomResource> rList) {
		super();
		this.userId = userId;
		this.roomColor = roomColor;
		this.guestBookOpen = guestBookOpen;
		this.rList = rList;
	}

	public int getGuestBookOpen() {
		return guestBookOpen;
	}

	public void setGuestBookOpen(int guestBookOpen) {
		this.guestBookOpen = guestBookOpen;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoomColor() {
		return roomColor;
	}

	public void setRoomColor(String roomColor) {
		this.roomColor = roomColor;
	}

	public ArrayList<UserRoomResource> getrList() {
		return rList;
	}

	public void setrList(ArrayList<UserRoomResource> rList) {
		this.rList = rList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserRoom [userId=" + userId + ", roomColor=" + roomColor + ", guestBookOpen=" + guestBookOpen
				+ ", rList=" + rList + "]";
	}
}
