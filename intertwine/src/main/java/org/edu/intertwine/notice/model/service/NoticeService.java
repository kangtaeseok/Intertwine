package org.edu.intertwine.notice.model.service;

import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.notice.model.vo.Notice;

public interface NoticeService {
	
	 ArrayList<Notice> selectList(Paging paging);	
	 Notice selectNoticeOne(int noticeId);	
	 int insertNotice(Notice notice);	
	 int updateNotice(Notice notice);	
	 int deleteNotice(int noticeId);
	 int selectListCount();
	 int selectSearchTitleCount(String keyword);
	 ArrayList<Notice> selectSearchTitle(Search search);
	 void updateAddReadCount(int noticeId);
	 Notice selectLast();

}
