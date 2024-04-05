package org.edu.intertwine.admin.model.dao;

import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.VisitCount;
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

}
