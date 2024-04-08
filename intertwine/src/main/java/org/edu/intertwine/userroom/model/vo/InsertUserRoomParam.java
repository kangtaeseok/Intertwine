package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;

public class InsertUserRoomParam implements Serializable { // sql문 매핑용 vo 클래스
	private static final long serialVersionUID = 4172978735392065105L;
	
	private String userId; // 사용자 ID
    private int resourceId; // 리소스 고유번호
	private double resourcePositionX; // 리소스 배치 X좌표 
	private double resourcePositionY; // 리소스 배치 Y좌표
	private double resourceRotation; // 리소스 회전각도
	private double resourceScale; // 리소스 크기
	
	public InsertUserRoomParam() {
		super();
	}
	
	public InsertUserRoomParam(String userId, int resourceId, double resourcePositionX, double resourcePositionY,
			double resourceRotation, double resourceScale) {
		super();
		this.userId = userId;
		this.resourceId = resourceId;
		this.resourcePositionX = resourcePositionX;
		this.resourcePositionY = resourcePositionY;
		this.resourceRotation = resourceRotation;
		this.resourceScale = resourceScale;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public double getResourcePositionX() {
		return resourcePositionX;
	}

	public void setResourcePositionX(double resourcePositionX) {
		this.resourcePositionX = resourcePositionX;
	}

	public double getResourcePositionY() {
		return resourcePositionY;
	}

	public void setResourcePositionY(double resourcePositionY) {
		this.resourcePositionY = resourcePositionY;
	}

	public double getResourceRotation() {
		return resourceRotation;
	}

	public void setResourceRotation(double resourceRotation) {
		this.resourceRotation = resourceRotation;
	}

	public double getResourceScale() {
		return resourceScale;
	}

	public void setResourceScale(double resourceScale) {
		this.resourceScale = resourceScale;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "InsertUserRoomParam [userId=" + userId + ", resourceId=" + resourceId + ", resourcePositionX="
				+ resourcePositionX + ", resourcePositionY=" + resourcePositionY + ", resourceRotation="
				+ resourceRotation + ", resourceScale=" + resourceScale + "]";
	}
	
}
