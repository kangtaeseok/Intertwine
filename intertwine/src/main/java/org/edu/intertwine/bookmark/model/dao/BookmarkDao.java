package org.edu.intertwine.bookmark.model.dao;

import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bookmarkDao")
public class BookmarkDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int selectIsBookmarked(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bookmarkMapper.selectIsBookmarked", bookmark);
	}
	
}
