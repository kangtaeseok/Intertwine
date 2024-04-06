package org.edu.intertwine.usercharacter.model.dao;

import org.edu.intertwine.usercharacter.model.vo.UserCharacter;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userCharacterDao")
public class UserCharacterDao {
	// 마이바이스 매퍼 파일에 쿼리문 별도로 작성함
	// root-context.xml 에 지정된 마이바티스 연결 객체를 사용함
	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public UserCharacter selectUserCharacterFirst(String userId) {
		return sqlSessionTemplate.selectOne("userCharacterMapper.selectUserCharacterFirst", userId);
	}
	
	public UserCharacter selectUserCharacter(String userId) {
		return sqlSessionTemplate.selectOne("userCharacterMapper.selectUserCharacter", userId);
	}

	public int UpdateUserCharacter(UserCharacter userCharacter) {
		return sqlSessionTemplate.update("userCharacterMapper.UpdateUserCharacter", userCharacter);
	}
	
	public int insertUserCharacterFirst(String userId) {
		return sqlSessionTemplate.insert("userCharacterMapper.insertUserCharacterFirst", userId);
	}

	public int insertUserCharacter(UserCharacter userCharacter) {
		return sqlSessionTemplate.insert("userCharacterMapper.insertUserCharacter", userCharacter);
	}

	public int deleteUserCharacter(String userId) {
		return sqlSessionTemplate.delete("userCharacterMapper.deleteUserCharacter", userId);
	}
}
