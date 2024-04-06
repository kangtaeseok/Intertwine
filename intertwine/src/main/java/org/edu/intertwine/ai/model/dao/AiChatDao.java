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

	public AiChat selectAiChatOne(int aiChatId) {
		return sqlSessionTemplate.selectOne("aiChatMapper.selectAiChatOne", aiChatId);
	}

	public int insertAiChat(AiChat aiChat) {
		return sqlSessionTemplate.insert("aiChatMapper.insertAiChat", aiChat);
	}

	public int updateAiChat(AiChat aiChat) {
		return sqlSessionTemplate.update("aiChatMapper.updateAiChat", aiChat);
	}

	public int deleteAiChat(int aiChatId) {
		return sqlSessionTemplate.delete("aiChatMapper.deleteAiChat", aiChatId);
	}
	
	public ArrayList<AiChat> selectAiChatByKeyword(String keyword) {
		List<AiChat> list = sqlSessionTemplate.selectList("aiChatMapper.selectAiChatByKeyword", keyword);
		return (ArrayList<AiChat>)list;
	}
	
}
