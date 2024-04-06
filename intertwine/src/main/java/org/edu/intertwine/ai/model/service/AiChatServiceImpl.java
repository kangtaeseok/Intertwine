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
	public AiChat selectAiChatOne(int aiChatId) {
		return aiChatDao.selectAiChatOne(aiChatId);
	}

	@Override
	public int insertAiChat(AiChat aiChat) {
		return aiChatDao.insertAiChat(aiChat);
	}

	@Override
	public int updateAiChat(AiChat aiChat) {
		return aiChatDao.updateAiChat(aiChat);
	}

	@Override
	public int deleteAiChat(int aiChatId) {
		return aiChatDao.deleteAiChat(aiChatId);
	}

	@Override
	public ArrayList<AiChat> selectAiChatByKeyword(String keyword) {
		return aiChatDao.selectAiChatByKeyword(keyword);
	}
	
}
