package org.edu.intertwine.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
	private static final long serialVersionUID = 5801563317534031206L;
	private String userId;
	private String userName;
	private String userPwd;
	private String nickname;
	private String email;
	private String phone;
	private String address;
	private java.sql.Date registerTime;
	private String accoutStatus;
	private int visible;
	private int userStatus;
	private String userStop;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public java.sql.Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(java.sql.Date registerTime) {
		this.registerTime = registerTime;
	}
	public String getAccoutStatus() {
		return accoutStatus;
	}
	public void setAccoutStatus(String accoutStatus) {
		this.accoutStatus = accoutStatus;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserStop() {
		return userStop;
	}
	public void setUserStop(String userStop) {
		this.userStop = userStop;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public User(String userId, String userName, String userPwd, String nickname, String email, String phone,
			String address, Date registerTime, String accoutStatus, int visible,
			int userStatus, String userStop) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.address = address;	
		
		this.registerTime = registerTime;
		this.accoutStatus = accoutStatus;
		this.visible = visible;
		this.userStatus = userStatus;
		this.userStop = userStop;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", nickname=" + nickname
				+ ", email=" + email + ", phone=" + phone + ", address=" + address 
				+ ", registerTime=" + registerTime + ", accoutStatus=" + accoutStatus
				+ ", visible=" + visible + ", userStatus=" + userStatus + ", userStop=" + userStop + "]";
	}
	public User() {
		super();
	}
	
	
	
}
