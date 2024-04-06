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

	public AiEvent selectAiEventOne(int aiEventId) {
		return sqlSessionTemplate.selectOne("aiEventMapper.selectAiEventOne", aiEventId);
	}

	public int insertAiEvent(AiEvent aiEvent) {
		return sqlSessionTemplate.insert("aiEventMapper.insertAiEvent", aiEvent);
	}

	public int updateAiEvent(AiEvent aiEvent) {
		return sqlSessionTemplate.update("aiEventMapper.updateAiEvent", aiEvent);
	}

	public int deleteAiEvent(int aiEventId) {
		return sqlSessionTemplate.delete("aiEventMapper.deleteAiEvent", aiEventId);
	}

	public ArrayList<AiEvent> selectAiEventByKeyword(String keyword) {
		List<AiEvent> list = sqlSessionTemplate.selectList("aiEventMapper.selectAiEventByKeyword", keyword);
		return (ArrayList<AiEvent>)list;
	}
	
}
