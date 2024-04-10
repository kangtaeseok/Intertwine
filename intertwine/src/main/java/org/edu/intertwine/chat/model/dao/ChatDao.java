package org.edu.intertwine.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.chat.model.vo.Chat;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ChatDao")

public class ChatDao {
	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Chat> selectAllChatRoomList(Chat chat) {
		List<Chat> list = sqlSessionTemplate.selectList("chatMapper.selectAllChatRoomList", chat);
		return (ArrayList<Chat>)list;
	}

	public int insertChatRoom(Chat chat) {
		return sqlSessionTemplate.insert("chatMapper.insertChatRoom", chat);
	}

	public int selectOneChatRoom(Chat chat) {
		return sqlSessionTemplate.selectOne("chatMapper.selectOneChatRoom", chat);
	}

	public Object deleteChatRoom(Chat chat) {
		return sqlSessionTemplate.delete("chatMapper.deleteChatRoom", chat);
	}
	
	
}
