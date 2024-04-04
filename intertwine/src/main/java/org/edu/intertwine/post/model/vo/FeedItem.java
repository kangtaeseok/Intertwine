package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

import org.edu.intertwine.user.model.vo.User;

public class FeedItem implements Serializable{
   
	private static final long serialVersionUID = 6288430137089218048L;
	//피드 한개에 필요한 정보들이 나옴
    //피드에 나올 사용자 아이디가 들어감
    private User user; // 사용자 .userid사용자아이디(보일수도있고 아닐수도 있음), .nickname 별명 -> 프로필에 보임
    //private Mypage mypage; //여기서 .profile 프로필 사진 받아옴
    private String userProfile; //유저디폴트 사진 일단 가져감
    private Post post; // 포스트 .postid 안보여도 필요함 .
    private Image image; //이미지 위도 경도 경로로 위치와 사진 불러옴 -> 주소 가능할수도 있음
    private Video video; //비디오 (없을 수 있음)
    private int likeCount; //공감갯수
    

	public FeedItem(User user, String userProfile, Post post, Image image, Video video, int likeCount) {
		super();
		this.user = user;
		this.userProfile = userProfile;
		this.post = post;
		this.image = image;
		this.video = video;
		this.likeCount = likeCount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "FeedItem [user=" + user + ", userProfile=" + userProfile + ", post=" + post + ", image=" + image
				+ ", video=" + video + ", likeCount=" + likeCount + "]";
	}

	
    
    
}
