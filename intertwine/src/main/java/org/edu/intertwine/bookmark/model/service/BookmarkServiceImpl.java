package org.edu.intertwine.bookmark.model.service;

import org.edu.intertwine.bookmark.model.dao.BookmarkDao;
import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bookmarkService")
public class BookmarkServiceImpl implements BookmarkService{

	@Autowired
	BookmarkDao bookmarkDao;
	
	@Override
	public int selectIsBookmarked(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.selectIsBookmarked(bookmark);
	}

	@Override
	public int insertBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.insertBookmark(bookmark);
	}

	@Override
	public int deleteBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.deleteBookmark(bookmark);
	}

}
