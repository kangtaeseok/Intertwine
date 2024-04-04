package org.edu.intertwine.post.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import org.edu.intertwine.user.model.vo.User;

public class DetailView implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = -1871285271819806579L;
	//상대의 postId를 받아옴 생성자 잘 만들기 
    private ArrayList<Image> images;
    private Video video;
    private User user;
    private Post post;
    private ArrayList<Tag> tags;
    private ArrayList<Reply> replies;
    
    
    
	public DetailView() {
		super();
	}



	public DetailView(ArrayList<Image> images, Video video, User user, Post post, ArrayList<Tag> tags,
			ArrayList<Reply> replies) {
		super();
		this.images = images;
		this.video = video;
		this.user = user;
		this.post = post;
		this.tags = tags;
		this.replies = replies;
	}



	public ArrayList<Image> getImages() {
		return images;
	}



	public void setImages(ArrayList<Image> images) {
		this.images = images;
	}



	public Video getVideo() {
		return video;
	}



	public void setVideo(Video video) {
		this.video = video;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public Post getPost() {
		return post;
	}



	public void setPost(Post post) {
		this.post = post;
	}



	public ArrayList<Tag> getTags() {
		return tags;
	}



	public void setTags(ArrayList<Tag> tags) {
		this.tags = tags;
	}



	public ArrayList<Reply> getReplies() {
		return replies;
	}



	public void setReplies(ArrayList<Reply> replies) {
		this.replies = replies;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "DetailView [images=" + images + ", video=" + video + ", user=" + user + ", post=" + post + ", tags="
				+ tags + ", replies=" + replies + "]";
	}
    
	
    

}