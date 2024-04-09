package org.edu.intertwine.ai.model.vo;

public class AiEvent implements java.io.Serializable {
	
	private static final long serialVersionUID = -1278727868582020315L;
	
	private int aiEventId;
	private String adminId;
	private String aiEventName;
	private String aiEventContent;
	private String aiEventLink;
	
	public AiEvent() {
		super();
	}
	
	public AiEvent(int aiEventId, String adminId, String aiEventName, String aiEventContent, String aiEventLink) {
		super();
		this.aiEventId = aiEventId;
		this.adminId = adminId;
		this.aiEventName = aiEventName;
		this.aiEventContent = aiEventContent;
		this.aiEventLink = aiEventLink;
	}
	
	public int getAiEventId() {
		return aiEventId;
	}
	
	public void setAiEventId(int aiEventId) {
		this.aiEventId = aiEventId;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public String getAiEventName() {
		return aiEventName;
	}
	
	public void setAiEventName(String aiEventName) {
		this.aiEventName = aiEventName;
	}
	
	public String getAiEventContent() {
		return aiEventContent;
	}
	
	public void setAiEventContent(String aiEventContent) {
		this.aiEventContent = aiEventContent;
	}
	
	public String getAiEventLink() {
		return aiEventLink;
	}
	
	public void setAiEventLink(String aiEventLink) {
		this.aiEventLink = aiEventLink;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "AiEvent [aiEventId=" + aiEventId + ", adminId=" + adminId + ", aiEventName=" + aiEventName
				+ ", aiEventContent=" + aiEventContent + ", aiEventLink=" + aiEventLink + "]";
	}
	
}
