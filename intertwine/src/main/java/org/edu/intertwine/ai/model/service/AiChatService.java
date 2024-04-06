package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.vo.AiChat;

public interface AiChatService {
		
	AiChat selectAiChatOne(int aiChatId);
	int insertAiChat(AiChat aiChat);	
	int updateAiChat(AiChat aiChat);	
	int deleteAiChat(int aiChatId);
	ArrayList<AiChat> selectAiChatByKeyword(String keyword);
}
