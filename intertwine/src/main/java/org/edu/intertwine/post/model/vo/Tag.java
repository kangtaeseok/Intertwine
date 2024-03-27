package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

public class Tag implements Serializable{
	
	private static final long serialVersionUID = -8511931674958536837L;
	private int postId;
	private String tagName;
	
	public Tag() {
		super();
	}

	public Tag(int postId, String tagName) {
		super();
		this.postId = postId;
		this.tagName = tagName;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tag [postId=" + postId + ", tagName=" + tagName + "]";
	}
	
	
}
