package org.edu.intertwine.post.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Post implements Serializable {
	private static final long serialVersionUID = 2351032028621778313L;
	
	private int postId;
	private String userId;
	private String postContent;
	private String postVisible;
	private Date postTime;
	private int postView;
	private int postDraft;
	private int postLikeCounts;
	
	public Post() {
		super();
	}

	public Post(int postId, String userId, String postContent, String postVisible, Date postTime, int postView,
			int postDraft, int postLikeCounts) {
		super();
		this.postId = postId;
		this.userId = userId;
		this.postContent = postContent;
		this.postVisible = postVisible;
		this.postTime = postTime;
		this.postView = postView;
		this.postDraft = postDraft;
		this.postLikeCounts = postLikeCounts;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostVisible() {
		return postVisible;
	}

	public void setPostVisible(String postVisible) {
		this.postVisible = postVisible;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public int getPostView() {
		return postView;
	}

	public void setPostView(int postView) {
		this.postView = postView;
	}

	public int getPostDraft() {
		return postDraft;
	}

	public void setPostDraft(int postDraft) {
		this.postDraft = postDraft;
	}

	public int getPostLikeCounts() {
		return postLikeCounts;
	}

	public void setPostLikeCounts(int postLikeCounts) {
		this.postLikeCounts = postLikeCounts;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", userId=" + userId + ", postContent=" + postContent + ", postVisible="
				+ postVisible + ", postTime=" + postTime + ", postView=" + postView + ", postDraft=" + postDraft
				+ ", postLikeCounts=" + postLikeCounts + "]";
	}
	
	
	
	
}
