package org.edu.intertwine.chat.model.service;

import java.util.ArrayList;

import org.edu.intertwine.chat.model.dao.ChatDao;
import org.edu.intertwine.chat.model.vo.Chat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Override
	public ArrayList<Chat> selectAllChatRoomList(Chat chat) {
		return chatDao.selectAllChatRoomList(chat);
	}

	@Override
	public int insertChatRoom(Chat chat) {
		return chatDao.insertChatRoom(chat);
	}

	@Override
	public int selectOneChatRoom(Chat chat) {
		return chatDao.selectOneChatRoom(chat);
	}

	@Override
	public void deleteChatRoom(Chat chat) {
		chatDao.deleteChatRoom(chat);
		
	}
}
