package org.edu.intertwine.admin.model.service;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.VisitCount;


public interface AdminService {

	Admin selectAdmin(String adminId);

	 void insertVisitCount();

	 void updateVisitCount();

	 VisitCount selectVisitCount();

	 int selectVisitCountAll();

	int selectVisitCountMonth(String string);
}
