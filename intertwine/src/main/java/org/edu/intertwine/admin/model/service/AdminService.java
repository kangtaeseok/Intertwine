package org.edu.intertwine.admin.model.service;

import java.util.ArrayList;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.admin.model.vo.VisitCount;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.Time;


public interface AdminService {

	//로그인
	Admin selectAdmin(String adminId);

	//신고처리용
	int selectRptListCount();

	//페이징처리
	ArrayList<ContentReport> selectRptList(Paging paging);
	
	int selectSeachUserIdCount(String keyword);
	int selectSeachBoardNumCount(String keyword);
	int selectSeachStatusCount(String keyword);

	ArrayList<ContentReport> selectSearchUserId(Search search);
	ArrayList<ContentReport> selectSeachBoardNum(Search search);
	ArrayList<ContentReport> selectSeachStatus(Search search);
	
	
	//신고insert
	int insertRptPost(ContentReport cpt);
	int insertRptComment(ContentReport cpt);

	
	//신고리스트
	ArrayList<ContentReport> selectPostNumList(int boardNum);

	//처리완료
	int updateRptStatus(int reportId);
	
	//미확인  > 처리중
	void updateRptStatusing(int boardNum);
	void updateRptCStatusing(int boardNum);

	//신고댓글 리스트
	ContentReport selectRptComment(int commentId);

	ArrayList<ContentReport> selectReportAlarm();

	//신고상세 페이징
	int selectReportBoardNumCount(int boardNum);
	int selectReportCommentCount(int commentId);

	
	//방문수
	int selectVisitCountTime(Time time);
	int selectVisitCountToday();
	void insertVisitCount();
	void updateVisitCount();
	VisitCount selectVisitCount();
	int selectVisitCountAll();
	int selectVisitCountMonth(String string);


}
