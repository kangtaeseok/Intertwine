package org.edu.intertwine.ai.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.ai.model.vo.AiChat;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aiChatDao")
public class AiChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<AiChat> selectAiChatByKeyword(String keyword) {
		List<AiChat> list = sqlSessionTemplate.selectList("aiChatMapper.selectAiChatByKeyword", keyword);
		return (ArrayList<AiChat>)list;
	}
	
}
