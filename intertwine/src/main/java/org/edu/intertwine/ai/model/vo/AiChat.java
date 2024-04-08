package org.edu.intertwine.ai.model.vo;

public class AiChat implements java.io.Serializable {
	
	private static final long serialVersionUID = 209504773372003314L;
	
	private int aiChatId;
	private String adminId;
	private String aiChatTitle;
	private String aiChatContent;
	
	public AiChat() {
		super();
	}
	
	public AiChat(int aiChatId, String adminId, String aiChatTitle, String aiChatContent) {
		super();
		this.aiChatId = aiChatId;
		this.adminId = adminId;
		this.aiChatTitle = aiChatTitle;
		this.aiChatContent = aiChatContent;
	}
	
	public int getAiChatId() {
		return aiChatId;
	}
	
	public void setAiChatId(int aiChatId) {
		this.aiChatId = aiChatId;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public String getAiChatTitle() {
		return aiChatTitle;
	}
	
	public void setAiChatTitle(String aiChatTitle) {
		this.aiChatTitle = aiChatTitle;
	}
	
	public String getAiChatContent() {
		return aiChatContent;
	}
	
	public void setAiChatContent(String aiChatContent) {
		this.aiChatContent = aiChatContent;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "AiChat [aiChatId=" + aiChatId + ", adminId=" + adminId + ", aiChatTitle=" + aiChatTitle
				+ ", aiChatContent=" + aiChatContent + "]";
	}
	
}
	
	
