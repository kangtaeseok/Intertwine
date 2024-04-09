package org.edu.intertwine.post.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class Gallery implements Serializable{

	private static final long serialVersionUID = 5695941033913869207L;
	
	private Video video; //.videoURL비디오 주소
    private Image image; //.lon .lat .url을 가져옴
    private Post post; // .postcontent .postId .posttime .postview .postpin .postvisible게시시간
    private int likeCount; //공감갯수
    private int CommentCount; //댓글갯수
    private ArrayList<Tag> tags; //태그들 (여러개) postId.getTagName
    
	public Gallery() {
		super();
	}

	public Gallery(Video video, Image image, Post post, int likeCount, int commentCount, ArrayList<Tag> tags) {
		super();
		this.video = video;
		this.image = image;
		this.post = post;
		this.likeCount = likeCount;
		CommentCount = commentCount;
		this.tags = tags;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getCommentCount() {
		return CommentCount;
	}

	public void setCommentCount(int commentCount) {
		CommentCount = commentCount;
	}

	public ArrayList<Tag> getTags() {
		return tags;
	}

	public void setTags(ArrayList<Tag> tags) {
		this.tags = tags;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Gallery [video=" + video + ", image=" + image + ", post=" + post + ", likeCount=" + likeCount
				+ ", CommentCount=" + CommentCount + ", tags=" + tags + "]";
	}
    
    

}
