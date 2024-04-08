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


	//신고처리용
	int selectRptListCount();

	ArrayList<ContentReport> selectRptList(Paging paging);
	
	int selectSeachUserIdCount(String keyword);
	int selectSeachBoardNumCount(String keyword);
	int selectSeachStatusCount(String keyword);

	ArrayList<ContentReport> selectSearchUserId(Search search);
	ArrayList<ContentReport> selectSeachBoardNum(Search search);
	ArrayList<ContentReport> selectSeachStatus(Search search);
	
	
	//신고insert
	int insertRptPost(String postId);
	int insertRptComment(String commentId);

	ArrayList<ContentReport> selectPostNumList(int boardNum);

	int updateRptStatus(int reportId);

	void updateRptStatusing(int boardNum);

	ContentReport selectRptComment(int commentId);

	void updateRptCStatusing(int boardNum);

}
