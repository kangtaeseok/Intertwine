package org.edu.intertwine.post.model.vo;

import java.io.Serializable;

public class Image implements Serializable {

	private static final long serialVersionUID = -3954493420957792251L;
	private int imageId;
	private int postId;
	private float imageLon;
	private float imageLat;
	private String imageURL;
	
	public Image() {
		super();
	}

	public Image(int imageId, int postId, float imageLon, float imageLat, String imageURL) {
		super();
		this.imageId = imageId;
		this.postId = postId;
		this.imageLon = imageLon;
		this.imageLat = imageLat;
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

	public float getImageLon() {
		return imageLon;
	}

	public void setImageLon(float imageLon) {
		this.imageLon = imageLon;
	}

	public float getImageLat() {
		return imageLat;
	}

	public void setImageLat(float imageLat) {
		this.imageLat = imageLat;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	@Override
	public String toString() {
		return "Image [imageId=" + imageId + ", postId=" + postId + ", imageLon=" + imageLon + ", imageLat=" + imageLat
				+ ", imageURL=" + imageURL + "]";
	}
	
	
	
}
