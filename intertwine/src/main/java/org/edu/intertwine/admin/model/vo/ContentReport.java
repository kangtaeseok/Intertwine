package org.edu.intertwine.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ContentReport implements Serializable {
	private static final long serialVersionUID = 6259397750403912022L;
	private int reportId;
	private String userId;
	private int boardNum;
	private int reportComment;
	private String reportReason;
	private java.sql.Date reportTime;
	private String reportStatus;
	public ContentReport(int reportId, String userId, int boardNum, int reportComment, String reportReason,
			Date reportTime, String reportStatus) {
		super();
		this.reportId = reportId;
		this.userId = userId;
		this.boardNum = boardNum;
		this.reportComment = reportComment;
		this.reportReason = reportReason;
		this.reportTime = reportTime;
		this.reportStatus = reportStatus;
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getReportComment() {
		return reportComment;
	}
	public void setReportComment(int reportComment) {
		this.reportComment = reportComment;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public java.sql.Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(java.sql.Date reportTime) {
		this.reportTime = reportTime;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ContentReport [reportId=" + reportId + ", userId=" + userId + ", boardNum=" + boardNum
				+ ", reportComment=" + reportComment + ", reportReason=" + reportReason + ", reportTime=" + reportTime
				+ ", reportStatus=" + reportStatus + "]";
	}
	public ContentReport() {
		super();
	}
	
	
	
	
	
	

}
