package org.edu.intertwine.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.admin.model.dao.AdminDao;
import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.admin.model.vo.VisitCount;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin selectAdmin(String adminId) {
		return adminDao.selectAdmin(adminId);
	}
	
	@Override
    public void insertVisitCount() {
		adminDao.insertVisitCount();
    }

    @Override
    public void updateVisitCount() {
    	adminDao.updateVisitCount();
    }

    @Override
    public VisitCount selectVisitCount() {
        return adminDao.selectVisitCount();
    }

	@Override
	public int selectVisitCountAll() {
		return adminDao.selectVisitCountAll();
	}

	@Override
	public int selectVisitCountMonth(String string) {
		return adminDao.selectVisitCountMonth(string);
	}

	
	
	//신고 페이징 처리
	@Override
	public int selectRptListCount() {
		return adminDao.selectRptListCount();
	}

	@Override
	public ArrayList<ContentReport> selectRptList(Paging paging) {
		return adminDao.selectRptList(paging);
	}

	@Override
	public int selectSeachUserIdCount(String keyword) {
		return adminDao.selectSeachUserIdCount(keyword);
	}
	
	@Override
	public int selectSeachBoardNumCount(String keyword) {
		return adminDao.selectSeachBoardNumCount(keyword);
	}

	
	@Override
	public int selectSeachStatusCount(String keyword) {
		return adminDao.selectSeachStatusCount(keyword);
	}


	@Override
	public ArrayList<ContentReport> selectSearchUserId(Search search) {
		return adminDao.selectSearchUserId(search);
	}

	@Override
	public ArrayList<ContentReport> selectSeachBoardNum(Search search) {
		return adminDao.selectSeachBoardNum(search);
	}
	@Override
	public ArrayList<ContentReport> selectSeachStatus(Search search) {
		return adminDao.selectSeachStatus(search);
	}
	
	//신고insert
	public int insertRptPost(String postId) {
		return adminDao.insertRptPost(postId);
	}
	
	public int insertRptComment(String commentId) {
		return adminDao.insertRptComment(commentId);
	}

	@Override
	public ArrayList<ContentReport> selectPostNumList(int boardNum) {
		return adminDao.selectPostNumList(boardNum);
	}

	@Override
	public int updateRptStatus(int reportId) {
		return adminDao.updateRptStatus(reportId);
	}

	@Override
	public void updateRptStatusing(int boardNum) {
		adminDao.updateRptStatusing(boardNum);
		
	}

	@Override
	public ContentReport selectRptComment(int commentId) {
		return adminDao.selectRptComment(commentId);
	}

	@Override
	public void updateRptCStatusing(int boardNum) {
		adminDao.updateRptCStatusing(boardNum);
		
	}


	
}
