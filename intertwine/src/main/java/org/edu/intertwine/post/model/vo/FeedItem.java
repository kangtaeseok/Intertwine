package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

import org.edu.intertwine.user.model.vo.User;

public class FeedItem implements Serializable{
   
	private static final long serialVersionUID = 6288430137089218048L;
	//피드 한개에 필요한 정보들이 나옴
    //피드에 나올 사용자 아이디가 들어감
    private User user; // 사용자 .userid사용자아이디(보일수도있고 아닐수도 있음), .nickname 별명 -> 프로필에 보임
    //private Mypage mypage; //여기서 .profile 프로필 사진 받아옴
    private Post post; // 포스트 .postid 안보여도 필요함 .
    private Image image; //이미지 위도 경도 경로로 위치와 사진 불러옴 -> 주소 가능할수도 있음
    private Video video; //비디오 (없을 수 있음)
    private int likeCount; //공감갯수
    //private int isFollowed; // 팔로우중 아님 (0) 팔로우중임 (1)
    private int isLiked; // 공감아님(0) 공감중임(1)
    private int whatIsLiked; // 어떤걸 공감중?(0~4)
    private int isBookmarked; //북마크 아님(0) 북마크임 (1)
    private int isFollowing;
    private int isFollower;
	
    

	public int getIsFollowing() {
		return isFollowing;
	}

	public void setIsFollowing(int isFollowing) {
		this.isFollowing = isFollowing;
	}

	public int getIsFollower() {
		return isFollower;
	}

	public void setIsFollower(int isFollower) {
		this.isFollower = isFollower;
	}

	public FeedItem() {
		super();
	}

	public FeedItem(User user, Post post, Image image, Video video, int likeCount, int isLiked, int whatIsLiked,
			int isBookmarked, int isFollowing, int isFollower) {
		super();
		this.user = user;
		this.post = post;
		this.image = image;
		this.video = video;
		this.likeCount = likeCount;
		this.isLiked = isLiked;
		this.whatIsLiked = whatIsLiked;
		this.isBookmarked = isBookmarked;
		this.isFollowing = isFollowing;
		this.isFollower = isFollower;
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

	public int getIsLiked() {
		return isLiked;
	}

	public void setIsLiked(int isLiked) {
		this.isLiked = isLiked;
	}

	public int getWhatIsLiked() {
		return whatIsLiked;
	}

	public void setWhatIsLiked(int whatIsLiked) {
		this.whatIsLiked = whatIsLiked;
	}

	public int getIsBookmarked() {
		return isBookmarked;
	}

	public void setIsBookmarked(int isBookmarked) {
		this.isBookmarked = isBookmarked;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FeedItem [user=" + user + ", post=" + post + ", image=" + image + ", video=" + video + ", likeCount="
				+ likeCount + ", isLiked=" + isLiked + ", whatIsLiked=" + whatIsLiked + ", isBookmarked=" + isBookmarked
				+ "]";
	}
    
}