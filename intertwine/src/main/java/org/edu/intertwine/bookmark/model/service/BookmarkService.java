package org.edu.intertwine.bookmark.model.service;

import org.edu.intertwine.bookmark.model.dao.BookmarkDao;
import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bookmarkService")
public class BookmarkService {

	@Autowired
	private BookmarkDao bookmarkDao;

	public int selectBookmarkCount(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.selectBookmarkCount(bookmark);
	}

	public int deleteBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.deleteBookmark(bookmark);
	}

	public int insertBookmark(Bookmark bookmark) {
		// TODO Auto-generated method stub
		return bookmarkDao.insertBookmark(bookmark);
	}
	
}
