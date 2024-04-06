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


@Service("adminService")
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
	public ArrayList<ContentReport> selectSearchUserId(Search search) {
		return adminDao.selectSearchUserId(search);
	}

}
