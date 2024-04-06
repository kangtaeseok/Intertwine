package org.edu.intertwine.admin.model.service;

import java.util.ArrayList;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.admin.model.vo.VisitCount;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;


public interface AdminService {

	Admin selectAdmin(String adminId);

	 void insertVisitCount();

	 void updateVisitCount();

	 VisitCount selectVisitCount();

	 int selectVisitCountAll();

	int selectVisitCountMonth(String string);

	int selectRptListCount();

	ArrayList<ContentReport> selectRptList(Paging paging);

	int selectSeachUserIdCount(String keyword);

	ArrayList<ContentReport> selectSearchUserId(Search search);
}
