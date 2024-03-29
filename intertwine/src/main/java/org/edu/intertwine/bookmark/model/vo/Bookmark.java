package org.edu.intertwine.bookmark.model.vo;

import java.io.Serializable;

public class Bookmark implements Serializable {

	private static final long serialVersionUID = -1686057923151880945L;
	private String userId;
	private int postId;

	public Bookmark() {
		super();
	}

	public Bookmark(String userId, int postId) {
		super();
		this.userId = userId;
		this.postId = postId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bookmark [userId=" + userId + ", postId=" + postId + "]";
	}

}
