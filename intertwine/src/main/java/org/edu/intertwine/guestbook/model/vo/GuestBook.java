package org.edu.intertwine.guestbook.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

public class GuestBook implements Serializable {
	private static final long serialVersionUID = 5411100926197798616L;
	
	private int guestBookId;
	private String userId;
	private String writer;
	private String guestbookContent;
	private String backgroundColor;
	
	public GuestBook() {
		super();
	}
	
	public GuestBook(int guestBookId, String userId, String writer, String guestbookContent, String backgroundColor) {
		super();
		this.guestBookId = guestBookId;
		this.userId = userId;
		this.writer = writer;
		this.guestbookContent = guestbookContent;
		this.backgroundColor = backgroundColor;
	}
	
	
	public int getGuestBookId() {
		return guestBookId;
	}

	public void setGuestBookId(int guestBookId) {
		this.guestBookId = guestBookId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGuestbookContent() {
		return guestbookContent;
	}
	public void setGuestbookContent(String guestbookContent) {
		this.guestbookContent = guestbookContent;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "GuestBook [guestBookId=" + guestBookId + ", userId=" + userId + ", writer=" + writer + ", guestbookContent=" + guestbookContent
				+ ", backgroundColor=" + backgroundColor + "]";
	}
}
