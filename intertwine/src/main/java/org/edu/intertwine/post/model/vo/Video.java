package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

public class Video implements Serializable {

	private static final long serialVersionUID = 3220312551291817391L;
	
	private int videoId;
	private int postId;
	private String videoURL;
	
	public Video() {
		super();
	}

	public Video(int videoId, int postId) {
		super();
		this.videoId = videoId;
		this.postId = postId;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public String getVideoURL() {
		return videoURL;
	}

	public void setVideoURL(String videoURL) {
		this.videoURL = videoURL;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Video [videoId=" + videoId + ", postId=" + postId + "]";
	}
	
	
	
}
