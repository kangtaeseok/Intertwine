package org.edu.intertwine.faq.model.vo;

import java.sql.Date;

public class Faq implements java.io.Serializable  {

	private static final long serialVersionUID = 4069609867868027068L;
	
	private int faqNum;
	private String adminId;
	private String faqType;
	private String faqTitle;
	private String faqWriter;
	private String faqContent;
	private java.sql.Date faqDate;
	private int faqReadCount;
	
	public Faq() {
		super();
	}

	public Faq(int faqNum, String adminId, String faqType, String faqTitle, String faqWriter, String faqContent,
			Date faqDate, int faqReadCount) {
		super();
		this.faqNum = faqNum;
		this.adminId = adminId;
		this.faqType = faqType;
		this.faqTitle = faqTitle;
		this.faqWriter = faqWriter;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqReadCount = faqReadCount;
	}

	public int getFaqNum() {
		return faqNum;
	}

	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public java.sql.Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(java.sql.Date faqDate) {
		this.faqDate = faqDate;
	}

	public int getFaqReadCount() {
		return faqReadCount;
	}

	public void setFaqReadCount(int faqReadCount) {
		this.faqReadCount = faqReadCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Faq [faqNum=" + faqNum + ", adminId=" + adminId + ", faqType=" + faqType + ", faqTitle=" + faqTitle
				+ ", faqWriter=" + faqWriter + ", faqContent=" + faqContent + ", faqDate=" + faqDate + ", faqReadCount="
				+ faqReadCount + "]";
	}

	

	
	
	
}
