package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;

public class UserRoomResource implements Serializable{
	private static final long serialVersionUID = -671451751598167986L;
	
	private int resourceId; // 리소스 고유번호
	private double resourcePositionX; // 리소스 배치 X좌표 
	private double resourcePositionY; // 리소스 배치 Y좌표
	private double resourceRotation; // 리소스 회전각도
	private double resourceScale; // 리소스 크기
	
	// 테이블 조인해서 넣을 필드값
	private String resourceName; // 리소스 이름
	private String resourceURL; // 리소스 저장 위치

	private String userId; // 추가
	
	public UserRoomResource() {
		super();
	}

	public UserRoomResource(int resourceId, double resourcePositionX, double resourcePositionY, double resourceRotation,
			double resourceScale) {
		super();
		this.resourceId = resourceId;
		this.resourcePositionX = resourcePositionX;
		this.resourcePositionY = resourcePositionY;
		this.resourceRotation = resourceRotation;
		this.resourceScale = resourceScale;
	}

	public UserRoomResource(int resourceId, double resourcePositionX, double resourcePositionY, double resourceRotation,
			double resourceScale, String userId) {
		super();
		this.resourceId = resourceId;
		this.resourcePositionX = resourcePositionX;
		this.resourcePositionY = resourcePositionY;
		this.resourceRotation = resourceRotation;
		this.resourceScale = resourceScale;
		this.userId = userId;
	}

	public UserRoomResource(int resourceId, double resourcePositionX, double resourcePositionY, double resourceRotation,
			double resourceScale, String resourceName, String resourceURL, String userId) {
		super();
		this.resourceId = resourceId;
		this.resourcePositionX = resourcePositionX;
		this.resourcePositionY = resourcePositionY;
		this.resourceRotation = resourceRotation;
		this.resourceScale = resourceScale;
		this.resourceName = resourceName;
		this.resourceURL = resourceURL;
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

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getResourceURL() {
		return resourceURL;
	}

	public void setResourceURL(String resourceURL) {
		this.resourceURL = resourceURL;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserRoomResource [resourceId=" + resourceId + ", resourcePositionX=" + resourcePositionX
				+ ", resourcePositionY=" + resourcePositionY + ", resourceRotation=" + resourceRotation
				+ ", resourceScale=" + resourceScale + ", resourceName=" + resourceName + ", resourceURL=" + resourceURL
				+ ", userId=" + userId + "]";
	}
}
