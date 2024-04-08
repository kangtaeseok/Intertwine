package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.vo.AiEvent;

public interface AiEventService {

	AiEvent selectAiEventOne(int aiEventId);
	int insertAiEvent(AiEvent aiEvent);	
	int updateAiEvent(AiEvent aiEvent);	
	int deleteAiEvent(int aiEventId);
	ArrayList<AiEvent> selectAiEventByKeyword(String keyword);
}
