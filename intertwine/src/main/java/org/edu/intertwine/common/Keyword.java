package org.edu.intertwine.common;

import java.io.Serializable;

public class Keyword implements Serializable {
	private static final long serialVersionUID = 4133744099534146978L;
	private String userId;
	private String keyword;
	public Keyword(String userId, String keyword) {
		super();
		this.userId = userId;
		this.keyword = keyword;
	}
	public Keyword() {
		super();
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
		return "Keyword [userId=" + userId + ", keyword=" + keyword + "]";
	}
	
	
}
