package org.edu.intertwine.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.admin.model.vo.VisitCount;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.Time;
import org.edu.intertwine.user.controller.UserController;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Admin selectAdmin(String adminId) {
		return sqlSessionTemplate.selectOne("adminMapper.selectAdmin",adminId);
	}

	public void insertVisitCount() {
		sqlSessionTemplate.insert("adminMapper.insertVisitCount");
		
	}

	public void updateVisitCount() {
		sqlSessionTemplate.insert("adminMapper.updateVisitCount");
		
	}

	//그래프용
	public VisitCount selectVisitCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCount");
	}
	public int selectVisitCountAll() {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountAll");
	}
	public int selectVisitCountMonth(String string) {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountMonth", string);
	}

	
	//신고처리용
	public int selectRptListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectRptListCount");
	}

	public ArrayList<ContentReport> selectRptList(Paging paging) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectRptList", paging);
		return (ArrayList<ContentReport>)list;
	}

	//신고검색 처리용
	public int selectSeachUserIdCount(String keyword) {
		return sqlSessionTemplate.selectOne("adminMapper.selectSeachUserIdCount", keyword);
	}
	public int selectSeachBoardNumCount(String keyword) {
		return sqlSessionTemplate.selectOne("adminMapper.selectSeachBoardNumCount", keyword);
	}
	public int selectSeachStatusCount(String keyword) {
		return sqlSessionTemplate.selectOne("adminMapper.selectSeachStatusCount", keyword);
	}
	
	public ArrayList<ContentReport> selectSearchUserId(Search search) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectSearchUserId", search);
		return (ArrayList<ContentReport>)list;
	}	
	public ArrayList<ContentReport> selectSeachBoardNum(Search search) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectSeachBoardNum", search);
		return (ArrayList<ContentReport>)list;
	}
	public ArrayList<ContentReport> selectSeachStatus(Search search) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectSeachStatus", search);
		return (ArrayList<ContentReport>)list;
	}

	
	//신고insert
	public int insertRptPost(ContentReport cpt) {
		return sqlSessionTemplate.insert("adminMapper.insertRptPost", cpt);
	}
	public int insertRptComment(ContentReport cpt) {
		return sqlSessionTemplate.insert("adminMapper.insertRptComment", cpt);
	}
	

	public ArrayList<ContentReport> selectPostNumList(int boardNum) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectPostNumList", boardNum);
		return (ArrayList<ContentReport>)list;
	}

	
	
	//신고상태변경
	public int updateRptStatus(int reportId) {
		return sqlSessionTemplate.update("adminMapper.updateRptStatus", reportId);
	}

	public Object updateRptStatusing(int boardNum) {
		return sqlSessionTemplate.update("adminMapper.updateRptStatusing", boardNum);
	}

	public ContentReport selectRptComment(int commentId) {
		return sqlSessionTemplate.selectOne("adminMapper.selectRptComment", commentId);
	}

	public void updateRptCStatusing(int boardNum) {
		sqlSessionTemplate.update("adminMapper.updateRptCStatusing", boardNum);
		
	}

	public ArrayList<ContentReport> selectReportAlarm() {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectReportAlarm");
		return (ArrayList<ContentReport>)list;
	}

	public int selectVisitCountTime(Time time) {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountTime",time);
	}

	public int selectVisitCountToday() {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountToday");
	}

	public int selectReportBoardNumCount(int boardNum) {
		return sqlSessionTemplate.selectOne("adminMapper.selectReportBoardNumCount", boardNum);
	}

	public int selectReportCommentCount(int commentId) {
		return sqlSessionTemplate.selectOne("adminMapper.selectReportCommentCount", commentId);
	}

	//신고관리 리스트담아오기
	public List<ContentReport> selectContentReportList(Integer reportId) {
		return sqlSessionTemplate.selectList("adminMapper.selectContentReportList", reportId);
	}


	
}
