package org.edu.intertwine.usercharacter.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserCharacter implements Serializable {
	private static final long serialVersionUID = 1221543789517358811L;
	
	private String userId; // 사용자 ID
	private String hairStyleId; // 캐릭터 헤어 고유번호
	private String hatId; // 캐릭터 모자 고유번호
	private String topId; // 캐릭터 상의 고유번호
	private String bottomId; // 캐릭터 하의 고유번호
	
	// 테이블 조인해서 저장할 필드
	private String hairStyleImageURL; // 캐릭터 헤어 리소스 저장위치
	private String hatImageURL; // 캐릭터 모자 리소스 저장위치
	private String topImageURL; // 캐릭터 상의 리소스 저장위치
	private String bottomImageURL; // 캐릭터 하의 리소스 저장위치
	
	public UserCharacter() {
		super();
	}

	public UserCharacter(String userId, String hairStyleId, String hatId, String topId, String bottomId) {
		super();
		this.userId = userId;
		this.hairStyleId = hairStyleId;
		this.hatId = hatId;
		this.topId = topId;
		this.bottomId = bottomId;
	}

	public UserCharacter(String userId, String hairStyleId, String hairStyleImageURL, String hatId, String hatImageURL,
			String topId, String topImageURL, String bottomId, String bottomImageURL) {
		super();
		this.userId = userId;
		this.hairStyleId = hairStyleId;
		this.hairStyleImageURL = hairStyleImageURL;
		this.hatId = hatId;
		this.hatImageURL = hatImageURL;
		this.topId = topId;
		this.topImageURL = topImageURL;
		this.bottomId = bottomId;
		this.bottomImageURL = bottomImageURL;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getHairStyleId() {
		return hairStyleId;
	}

	public void setHairStyleId(String hairStyleId) {
		this.hairStyleId = hairStyleId;
	}

	public String getHairStyleImageURL() {
		return hairStyleImageURL;
	}

	public void setHairStyleImageURL(String hairStyleImageURL) {
		this.hairStyleImageURL = hairStyleImageURL;
	}

	public String getHatId() {
		return hatId;
	}

	public void setHatId(String hatId) {
		this.hatId = hatId;
	}

	public String getHatImageURL() {
		return hatImageURL;
	}

	public void setHatImageURL(String hatImageURL) {
		this.hatImageURL = hatImageURL;
	}

	public String getTopId() {
		return topId;
	}

	public void setTopId(String topId) {
		this.topId = topId;
	}

	public String getTopImageURL() {
		return topImageURL;
	}

	public void setTopImageURL(String topImageURL) {
		this.topImageURL = topImageURL;
	}

	public String getBottomId() {
		return bottomId;
	}

	public void setBottomId(String bottomId) {
		this.bottomId = bottomId;
	}

	public String getBottomImageURL() {
		return bottomImageURL;
	}

	public void setBottomImageURL(String bottomImageURL) {
		this.bottomImageURL = bottomImageURL;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserCharacter [userId=" + userId + ", hairStyleId=" + hairStyleId + ", hairStyleImageURL="
				+ hairStyleImageURL + ", hatId=" + hatId + ", hatImageURL=" + hatImageURL + ", topId=" + topId
				+ ", topImageURL=" + topImageURL + ", bottomId=" + bottomId + ", bottomImageURL=" + bottomImageURL
				+ "]";
	}
}
