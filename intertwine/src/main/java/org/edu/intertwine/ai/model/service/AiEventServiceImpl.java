package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.dao.AiEventDao;
import org.edu.intertwine.ai.model.vo.AiEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aiEventService")
public class AiEventServiceImpl implements AiEventService{
	
	@Autowired
	private AiEventDao aiEventDao;

	@Override
	public ArrayList<AiEvent> selectAiEventByKeyword(String keyword) {
		return aiEventDao.selectAiEventByKeyword(keyword);
	}
	
}
