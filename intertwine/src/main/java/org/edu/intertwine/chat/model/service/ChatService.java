package org.edu.intertwine.chat.model.service;

import java.util.ArrayList;

import org.edu.intertwine.chat.model.vo.Chat;
import org.edu.intertwine.user.model.vo.User;

public interface ChatService {

	ArrayList<Chat> selectAllChatRoomList(Chat chat);

	int insertChatRoom(Chat chat);

	int selectOneChatRoom(Chat chat);

	void deleteChatRoom(Chat chat);


}
