package org.edu.intertwine.bookmark.model.dao;

import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bookmarkDao")
public class BookmarkDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int selectBookmarkCount(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("bookmarkMapper.selectBookmarkCount", bookmark);
	}

	public int deleteBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("bookmarkMapper.deleteBookmark", bookmark);
	}

	public int insertBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("bookmarkMapper.insertBookmark", bookmark);
	}
	
}
