package org.edu.intertwine.comment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable{

	private static final long serialVersionUID = 5704190055684898517L;
	private int commentId;
	private int postId;
	private String userId;
	private String commentContent;
	private String commentLevel;
	private int parentCommentId;
	private Date commentTime;
	
	public Comment() {
		super();
	}

	//댓글용
	public Comment(int postId, String userId, String commentContent) {
		super();
		this.postId = postId;
		this.userId = userId;
		this.commentContent = commentContent;
	}

	public Comment(int postId, String userId, String commentContent, String commentLevel, int parentCommentId,
			Date commentTime) {
		super();
		this.postId = postId;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.parentCommentId = parentCommentId;
		this.commentTime = commentTime;
	}
	
	
	//대댓글 용
	public Comment(int postId, String userId, String commentContent, int parentCommentId) {
		super();
		this.postId = postId;
		this.userId = userId;
		this.commentContent = commentContent;
		this.parentCommentId = parentCommentId;
	}

	public Comment(int commentId, int postId, String userId, String commentContent, String commentLevel,
			int parentCommentId, Date commentTime) {
		super();
		this.commentId = commentId;
		this.postId = postId;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.parentCommentId = parentCommentId;
		this.commentTime = commentTime;
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

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", postId=" + postId + ", userId=" + userId + ", commentContent="
				+ commentContent + ", commentLevel=" + commentLevel + ", parentCommentId=" + parentCommentId
				+ ", commentTime=" + commentTime + "]";
	}
	
	
	

}
