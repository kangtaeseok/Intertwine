package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.vo.AiChat;

public interface AiChatService {
		
	ArrayList<AiChat> selectAiChatByKeyword(String keyword);
}
