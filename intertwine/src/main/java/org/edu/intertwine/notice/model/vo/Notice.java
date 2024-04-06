package org.edu.intertwine.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {

	private static final long serialVersionUID = -6525429872656322887L;
	
	private int noticeId;
	private String adminId;
	private String noticeTitle;
	private java.sql.Date noticeTime;
	private String noticeContent;
	private String originalFilePath;
	private String renameFilePath;
	private int noticeView;
	private int noticeLevel;
	
	public Notice() {
		super();
	}
	
	public Notice(int noticeId, String adminId, String noticeTitle, Date noticeTime,
			String noticeContent, String originalFilePath, String renameFilePath, int noticeView, int noticeLevel) {
		super();
		this.noticeId = noticeId;
		this.adminId = adminId;
		this.noticeTitle = noticeTitle;
		this.noticeTime = noticeTime;
		this.noticeContent = noticeContent;
		this.originalFilePath = originalFilePath;
		this.renameFilePath = renameFilePath;
		this.noticeView = noticeView;
		this.noticeLevel = noticeLevel;
	}
	
	public int getNoticeId() {
		return noticeId;
	}
	
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public String getNoticeTitle() {
		return noticeTitle;
	}
	
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	
	public java.sql.Date getNoticeTime() {
		return noticeTime;
	}
	
	public void setNoticeTime(java.sql.Date noticeTime) {
		this.noticeTime = noticeTime;
	}
	
	public String getNoticeContent() {
		return noticeContent;
	}
	
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	public String getOriginalFilePath() {
		return originalFilePath;
	}
	
	public void setOriginalFilePath(String originalFilePath) {
		this.originalFilePath = originalFilePath;
	}
	
	public String getRenameFilePath() {
		return renameFilePath;
	}
	
	public void setRenameFilePath(String renameFilePath) {
		this.renameFilePath = renameFilePath;
	}
	
	public int getNoticeView() {
		return noticeView;
	}
	
	public void setNoticeView(int noticeView) {
		this.noticeView = noticeView;
	}
	
	public int getNoticeLevel() {
		return noticeLevel;
	}
	
	public void setNoticeLevel(int noticeLevel) {
		this.noticeLevel = noticeLevel;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", adminId=" + adminId + ", noticeTitle="
				+ noticeTitle + ", noticeTime=" + noticeTime + ", noticeContent=" + noticeContent
				+ ", originalFilePath=" + originalFilePath + ", renameFilePath=" + renameFilePath + ", noticeView="
				+ noticeView + ", noticeLevel=" + noticeLevel + "]";
	}
	
}
