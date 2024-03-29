package org.edu.intertwine.post.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Like implements Serializable{
	
	private static final long serialVersionUID = -7812062885074141844L;
	private String userId;
	private int postId;
	private int likeType; //0: 좋아요 1: 하트 2: 웃겨요 3:슬퍼요 4: 화나요
	private Date likeTime;
	
	public Like() {
		super();
	}

	public Like(String userId, int postId, int likeType, Date likeTime) {
		super();
		this.userId = userId;
		this.postId = postId;
		this.likeType = likeType;
		this.likeTime = likeTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getLikeType() {
		return likeType;
	}

	public void setLikeType(int likeType) {
		this.likeType = likeType;
	}

	public Date getLikeTime() {
		return likeTime;
	}

	public void setLikeTime(Date likeTime) {
		this.likeTime = likeTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Like [userId=" + userId + ", postId=" + postId + ", likeType=" + likeType + ", likeTime=" + likeTime
				+ "]";
	}

	
}
