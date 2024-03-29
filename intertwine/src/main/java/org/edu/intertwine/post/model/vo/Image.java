package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

public class Image implements Serializable {

	private static final long serialVersionUID = -3954493420957792251L;
	private int imageId;
	private int postId;
	private double imageLon;
	private double imageLat;
	private String imageURL;
	
	public Image() {
		super();
	}
	
	
	//위도경도경로포스트 아이디 입력용
	public Image(int postId, double imageLon, double imageLat, String imageURL) {
		super();
		this.postId = postId;
		this.imageLon = imageLon;
		this.imageLat = imageLat;
		this.imageURL = imageURL;
	}
	

	//위도 경도 없을시 
	public Image(int postId, String imageURL) {
		super();
		this.postId = postId;
		this.imageURL = imageURL;
	}


	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public double getImageLon() {
		return imageLon;
	}

	public void setImageLon(double imageLon) {
		this.imageLon = imageLon;
	}

	public double getImageLat() {
		return imageLat;
	}

	public void setImageLat(double imageLat) {
		this.imageLat = imageLat;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Image [imageId=" + imageId + ", postId=" + postId + ", imageLon=" + imageLon + ", imageLat=" + imageLat
				+ ", imageURL=" + imageURL + "]";
	}

	
	
}
