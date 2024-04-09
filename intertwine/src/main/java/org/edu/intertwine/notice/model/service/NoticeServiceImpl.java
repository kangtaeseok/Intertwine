package org.edu.intertwine.notice.model.service;

import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.notice.model.dao.NoticeDao;
import org.edu.intertwine.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public ArrayList<Notice> selectList(Paging paging) {
		return noticeDao.selectList(paging);
	}

	@Override
	public Notice selectNoticeOne(int noticeId) {
		return noticeDao.selectNoticeOne(noticeId);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeId) {
		return noticeDao.deleteNotice(noticeId);
	}

	@Override
	public int selectListCount() {		
		return noticeDao.getListCount();
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		return noticeDao.selectSearchTitleCount(keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchTitle(Search search) {
		return noticeDao.selectSearchTitle(search);
	}

	@Override
	public void updateAddReadCount(int noticeId) {
		noticeDao.updateAddReadCount(noticeId);
	}

	@Override
	public Notice selectLast() {
		return noticeDao.selectLast();
	}
	

}
