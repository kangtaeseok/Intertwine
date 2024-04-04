package org.edu.intertwine.admin.model.service;

import org.edu.intertwine.admin.model.dao.AdminDao;
import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.VisitCount;
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

}
