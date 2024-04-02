package org.edu.intertwine.qna.model.vo;

import java.sql.Date;

public class Qna implements java.io.Serializable {

	private static final long serialVersionUID = 476106923803459604L;
	
	private int qnaNum;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private String qnaOriginalFileName;
	private String qnaRenameFileName;
	private int qnaRef;
	private int qnaReplyRef;
	private int qnaLev;
	private int qnaReplySeq;
	private int qnaReadCount;
	private java.sql.Date qnaDate;
	
	public Qna() {
		super();
	}

	public Qna(String qnaWriter, String qnaTitle, String qnaContent) {
		super();
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
	}	

	public Qna(int qnaNum, String qnaWriter, String qnaTitle, String qnaContent, String qnaOriginalFileName,
			String qnaRenameFileName, int qnaRef, int qnaReplyRef, int qnaLev, int qnaReplySeq,
			int qnaReadCount, Date qnaDate) {
		super();
		this.qnaNum = qnaNum;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaOriginalFileName = qnaOriginalFileName;
		this.qnaRenameFileName = qnaRenameFileName;
		this.qnaRef = qnaRef;
		this.qnaReplyRef = qnaReplyRef;
		this.qnaLev = qnaLev;
		this.qnaReplySeq = qnaReplySeq;
		this.qnaReadCount = qnaReadCount;
		this.qnaDate = qnaDate;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaOriginalFileName() {
		return qnaOriginalFileName;
	}

	public void setQnaOriginalFileName(String qnaOriginalFileName) {
		this.qnaOriginalFileName = qnaOriginalFileName;
	}

	public String getQnaRenameFileName() {
		return qnaRenameFileName;
	}

	public void setQnaRenameFileName(String qnaRenameFileName) {
		this.qnaRenameFileName = qnaRenameFileName;
	}

	public int getQnaRef() {
		return qnaRef;
	}

	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}

	public int getQnaReplyRef() {
		return qnaReplyRef;
	}

	public void setQnaReplyRef(int qnaReplyRef) {
		this.qnaReplyRef = qnaReplyRef;
	}

	public int getQnaLev() {
		return qnaLev;
	}

	public void setQnaLev(int qnaLev) {
		this.qnaLev = qnaLev;
	}

	public int getQnaReplySeq() {
		return qnaReplySeq;
	}

	public void setQnaReplySeq(int qnaReplySeq) {
		this.qnaReplySeq = qnaReplySeq;
	}

	public int getQnaReadCount() {
		return qnaReadCount;
	}

	public void setQnaReadCount(int qnaReadCount) {
		this.qnaReadCount = qnaReadCount;
	}

	public java.sql.Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(java.sql.Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Qna [qnaNum=" + qnaNum + ", qnaWriter=" + qnaWriter + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaOriginalFileName=" + qnaOriginalFileName
				+ ", qnaRenameFileName=" + qnaRenameFileName + ", qnaRef=" + qnaRef + ", qnaReplyRef="
				+ qnaReplyRef + ", qnaLev=" + qnaLev + ", qnaReplySeq=" + qnaReplySeq + ", qnaReadCount="
				+ qnaReadCount + ", qnaDate=" + qnaDate + "]";
	}
}
