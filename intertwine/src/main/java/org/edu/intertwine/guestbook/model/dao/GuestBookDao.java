package org.edu.intertwine.guestbook.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.guestbook.model.vo.GuestBook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("guestBookDao")
public class GuestBookDao {
	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<GuestBook> selectGuestBook(String userId) {
		List<GuestBook> list = sqlSessionTemplate.selectList("guestBookMapper.selectGuestBook", userId);
		return (ArrayList<GuestBook>)list;
	}

	public int insertGuestBook(GuestBook guestBook) {
		return sqlSessionTemplate.insert("guestBookMapper.insertGuestBook", guestBook);
	}

}
