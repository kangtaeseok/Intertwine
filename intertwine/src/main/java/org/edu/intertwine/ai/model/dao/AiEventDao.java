package org.edu.intertwine.ai.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.ai.model.vo.AiEvent;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aiEventDao")
public class AiEventDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<AiEvent> selectAiEventByKeyword(String keyword) {
		List<AiEvent> list = sqlSessionTemplate.selectList("aiEventMapper.selectAiEventByKeyword", keyword);
		return (ArrayList<AiEvent>)list;
	}
	
}
