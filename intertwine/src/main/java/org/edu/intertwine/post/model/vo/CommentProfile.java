package org.edu.intertwine.post.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CommentProfile implements Serializable {
	
	private static final long serialVersionUID = -6227873757505356418L;
	
	private int commentId;
	private int postId;
	private String userId;
	private String commentContent;
	private String commentLevel;
	private int parentCommentId;
	private Date commentTime;
	private String profile;
	private String profileDraft;
	
	public CommentProfile() {
		super();
	}

	public CommentProfile(int commentId, int postId, String userId, String commentContent, String commentLevel,
			int parentCommentId, Date commentTime, String profile, String profileDraft) {
		super();
		this.commentId = commentId;
		this.postId = postId;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.parentCommentId = parentCommentId;
		this.commentTime = commentTime;
		this.profile = profile;
		this.profileDraft = profileDraft;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
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

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(String commentLevel) {
		this.commentLevel = commentLevel;
	}

	public int getParentCommentId() {
		return parentCommentId;
	}

	public void setParentCommentId(int parentCommentId) {
		this.parentCommentId = parentCommentId;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getProfileDraft() {
		return profileDraft;
	}

	public void setProfileDraft(String profileDraft) {
		this.profileDraft = profileDraft;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CommentProfile [commentId=" + commentId + ", postId=" + postId + ", userId=" + userId
				+ ", commentContent=" + commentContent + ", commentLevel=" + commentLevel + ", parentCommentId="
				+ parentCommentId + ", commentTime=" + commentTime + ", profile=" + profile + ", profileDraft="
				+ profileDraft + "]";
	}
	


}
