package org.edu.intertwine.ai.model.service;

import java.util.ArrayList;

import org.edu.intertwine.ai.model.vo.AiEvent;

public interface AiEventService {

	ArrayList<AiEvent> selectAiEventByKeyword(String keyword);
}
