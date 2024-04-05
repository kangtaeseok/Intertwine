package org.edu.intertwine.userroom.model.vo;

import java.io.Serializable;

public class UserRoomResource implements Serializable{
	private static final long serialVersionUID = -671451751598167986L;
	
	private int ResourceId; // 리소스 고유번호
	private double ResourcePositionX; // 리소스 배치 X좌표 
	private double ResourcePositionY; // 리소스 배치 Y좌표
	private double ResourceRotation; // 리소스 회전각도
	private double ResourceScale; // 리소스 크기
	
	// 테이블 조인해서 넣을 필드값
	private String ResourceName; // 리소스 이름
	private String ResourceURL; // 리소스 저장 위치
	
	public UserRoomResource() {
		super();
	}
	
	public UserRoomResource(int resourceId, double resourcePositionX, double resourcePositionY, double resourceRotation, double resourceScale) {
		super();
		ResourceId = resourceId;
		ResourcePositionX = resourcePositionX;
		ResourcePositionY = resourcePositionY;
		ResourceRotation = resourceRotation;
		ResourceScale = resourceScale;
	}
	


	public UserRoomResource(int resourceId, double resourcePositionX, double resourcePositionY, double resourceRotation,
			double resourceScale, String resourceName, String resourceURL) {
		super();
		ResourceId = resourceId;
		ResourcePositionX = resourcePositionX;
		ResourcePositionY = resourcePositionY;
		ResourceRotation = resourceRotation;
		ResourceScale = resourceScale;
		ResourceName = resourceName;
		ResourceURL = resourceURL;
	}

	public int getResourceId() {
		return ResourceId;
	}
	public void setResourceId(int resourceId) {
		ResourceId = resourceId;
	}
	public double getResourcePositionX() {
		return ResourcePositionX;
	}
	public void setResourcePositionX(double resourcePositionX) {
		ResourcePositionX = resourcePositionX;
	}
	public double getResourcePositionY() {
		return ResourcePositionY;
	}
	public void setResourcePositionY(double resourcePositionY) {
		ResourcePositionY = resourcePositionY;
	}
	public double getResourceRotation() {
		return ResourceRotation;
	}
	public void setResourceRotation(double resourceRotation) {
		ResourceRotation = resourceRotation;
	}
	public double getResourceScale() {
		return ResourceScale;
	}
	public void setResourceScale(double resourceScale) {
		ResourceScale = resourceScale;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getResourceName() {
		return ResourceName;
	}

	public void setResourceName(String resourceName) {
		ResourceName = resourceName;
	}

	public String getResourceURL() {
		return ResourceURL;
	}

	public void setResourceURL(String resourceURL) {
		ResourceURL = resourceURL;
	}

	@Override
	public String toString() {
		return "UserRoomResource [ResourceId=" + ResourceId + ", ResourcePositionX=" + ResourcePositionX
				+ ", ResourcePositionY=" + ResourcePositionY + ", ResourceRotation=" + ResourceRotation
				+ ", ResourceScale=" + ResourceScale + ", ResourceName=" + ResourceName + ", ResourceURL=" + ResourceURL
				+ "]";
	}

	
	
}
