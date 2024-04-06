package org.edu.intertwine.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.admin.model.vo.VisitCount;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
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

	public VisitCount selectVisitCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCount");
	}

	public int selectVisitCountAll() {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountAll");
	}

	public int selectVisitCountMonth(String string) {
		return sqlSessionTemplate.selectOne("adminMapper.selectVisitCountMonth", string);
	}

	public int selectRptListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectRptListCount");
	}

	public ArrayList<ContentReport> selectRptList(Paging paging) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectRptList", paging);
		return (ArrayList<ContentReport>)list;
	}

	public int selectSeachUserIdCount(String keyword) {
		return sqlSessionTemplate.selectOne("adminMapper.selectSeachUserIdCount", keyword);
	}

	public ArrayList<ContentReport> selectSearchUserId(Search search) {
		List<ContentReport> list = sqlSessionTemplate.selectList("adminMapper.selectSearchUserId", search);
		return (ArrayList<ContentReport>)list;
	}

}
