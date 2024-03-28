package org.edu.intertwine.faq.model.vo;

import java.sql.Date;

public class Faq implements java.io.Serializable  {

	private static final long serialVersionUID = 4069609867868027068L;
	
	private String faqId;
	private String faqType;
	private String faqTitle;
	private String faqWriter;
	private String faqContent;
	private java.sql.Date enrollDate;
	private java.sql.Date lastModified;
	private int faqReadCnt;
	private String adminId;
	
	public Faq() {
		super();
	}

	public Faq(String faqId, String faqType, String faqTitle, String faqWriter, String faqContent, Date enrollDate,
			Date lastModified, int faqReadCnt, String adminId) {
		super();
		this.faqId = faqId;
		this.faqType = faqType;
		this.faqTitle = faqTitle;
		this.faqWriter = faqWriter;
		this.faqContent = faqContent;
		this.enrollDate = enrollDate;
		this.lastModified = lastModified;
		this.faqReadCnt = faqReadCnt;
		this.adminId = adminId;
	}

	public String getFaqId() {
		return faqId;
	}

	public void setFaqId(String faqId) {
		this.faqId = faqId;
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

	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public java.sql.Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(java.sql.Date lastModified) {
		this.lastModified = lastModified;
	}

	public int getFaqReadCnt() {
		return faqReadCnt;
	}

	public void setFaqReadCnt(int faqReadCnt) {
		this.faqReadCnt = faqReadCnt;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Faq [faqId=" + faqId + ", faqType=" + faqType + ", faqTitle=" + faqTitle + ", faqWriter=" + faqWriter
				+ ", faqContent=" + faqContent + ", enrollDate=" + enrollDate + ", lastModified=" + lastModified
				+ ", faqReadCnt=" + faqReadCnt + ", adminId=" + adminId + "]";
	}
	
	
	
	
}
