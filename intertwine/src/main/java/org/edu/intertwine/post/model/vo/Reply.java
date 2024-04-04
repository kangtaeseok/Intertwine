package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

import org.edu.intertwine.comment.model.vo.Comment;

public class Reply implements Serializable{
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -260837272609590440L;
	private Comment comment;
    private String profile;
    
    
	public Reply() {
		super();
	}


	public Reply(Comment comment, String profile) {
		super();
		this.comment = comment;
		this.profile = profile;
	}


	public Comment getComment() {
		return comment;
	}


	public void setComment(Comment comment) {
		this.comment = comment;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Reply [comment=" + comment + ", profile=" + profile + "]";
	}
	
	

}
