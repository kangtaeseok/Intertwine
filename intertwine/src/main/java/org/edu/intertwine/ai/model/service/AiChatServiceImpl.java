package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.dao.AiChatDao;
import org.edu.intertwine.ai.model.vo.AiChat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aiChatService")
public class AiChatServiceImpl implements AiChatService  {
	
	@Autowired
	private AiChatDao aiChatDao;

	@Override
	public ArrayList<AiChat> selectAiChatByKeyword(String keyword) {
		return aiChatDao.selectAiChatByKeyword(keyword);
	}
	
}
