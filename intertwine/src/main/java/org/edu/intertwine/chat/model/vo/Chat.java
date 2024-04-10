package org.edu.intertwine.chat.model.vo;

import org.edu.intertwine.user.model.vo.User;

public class Chat implements java.io.Serializable {

	private static final long serialVersionUID = -9075384373543277845L;
	
	private int chatId;
	private String userId1;
	private String userId2;
	private String chatName;
	
	public Chat(int chatId, String userId1, String userId2, String chatName) {
		super();
		this.chatId = chatId;
		this.userId1 = userId1;
		this.userId2 = userId2;
		this.chatName = chatName;
	}
	
	
	public Chat() {
		super();
	}
	
	
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getUserId1() {
		return userId1;
	}
	public void setUserId1(String userId1) {
		this.userId1 = userId1;
	}
	public String getUserId2() {
		return userId2;
	}
	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Chat [chatId=" + chatId + ", userId1=" + userId1 + ", userId2=" + userId2 + ", chatName=" + chatName
				+ "]";
	}
	

}
