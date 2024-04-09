package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

public class SearchMyPage implements Serializable{

	private static final long serialVersionUID = 2265583394843176455L;
	
	private String userId;
	private String keyword;
	
	public SearchMyPage(String userId, String keyword) {
		super();
		this.userId = userId;
		this.keyword = keyword;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SearchMyPage [userId=" + userId + ", keyword=" + keyword + "]";
	}
	
	
}
