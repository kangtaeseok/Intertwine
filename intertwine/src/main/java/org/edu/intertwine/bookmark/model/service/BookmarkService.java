package org.edu.intertwine.bookmark.model.service;

import org.edu.intertwine.bookmark.model.vo.Bookmark;

public interface BookmarkService {

	int selectIsBookmarked(Bookmark bookmark);

}
