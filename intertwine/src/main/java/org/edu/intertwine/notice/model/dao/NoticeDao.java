package org.edu.intertwine.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {
	//마이바티스 매퍼 파일에 쿼리문 별도로 작성함
	//root-context.xml 에 설정된 마이바티스 세션 객체를 연결 사용함
	@Autowired   //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Notice> selectList(Paging paging) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList", paging);
		return (ArrayList<Notice>)list;
	}

	public Notice selectNoticeOne(int noticeId) {
		return sqlSessionTemplate.selectOne("noticeMapper.selectNoticeOne", noticeId);
	}

	public int insertNotice(Notice notice) {
		return sqlSessionTemplate.insert("noticeMapper.insertNotice", notice);
	}

	public int updateNotice(Notice notice) {
		return sqlSessionTemplate.update("noticeMapper.updateNotice", notice);
	}

	public int deleteNotice(int noticeId) {
		return sqlSessionTemplate.delete("noticeMapper.deleteNotice", noticeId);
	}
	
	public int getListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.getListCount");
	}
	
	public int selectSearchTitleCount(String keyword) {
		return sqlSessionTemplate.selectOne("noticeMapper.selectSearchTitleCount", keyword);
	}

	public ArrayList<Notice> selectSearchTitle(Search search) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchTitle", search);
		return (ArrayList<Notice>)list;
	}
	
	public void updateAddReadCount(int noticeId) {
		sqlSessionTemplate.update("noticeMapper.updateAddReadCount", noticeId);
		
	}
	
	public Notice selectLast() {
		return sqlSessionTemplate.selectOne("noticeMapper.selectLast");
	}

	

	
	
	
}



