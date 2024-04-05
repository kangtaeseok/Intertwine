package org.edu.intertwine.userroom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userRoomDao")
public class UserRoomDao {
	// 마이바이스 매퍼 파일에 쿼리문 별도로 작성함
	// root-context.xml 에 지정된 마이바티스 연결 객체를 사용함
	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public UserRoom selectUserRoomFirst(String userId) {
		return sqlSessionTemplate.selectOne("userRoomMapper.selectUserRoomFirst", userId);
	}
	
	public UserRoom selectUserRoom(String userId) {
		return sqlSessionTemplate.selectOne("userRoomMapper.selectUserRoom", userId);
	}

	public int insertUserRoomFirst(String userId) {
		return sqlSessionTemplate.insert("userRoomMapper.insertUserRoomFirst", userId);
	}

	public int insertUserRoom(InsertUserRoomParam insertUserRoomParam) {
		return sqlSessionTemplate.insert("userRoomMapper.insertUserRoom", insertUserRoomParam);
	}

	public int deleteUserRoom(String userId) {
		return sqlSessionTemplate.delete("userRoomMapper.deleteUserRoom", userId);
	}
}
