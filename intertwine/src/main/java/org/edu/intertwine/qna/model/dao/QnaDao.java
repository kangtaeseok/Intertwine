package org.edu.intertwine.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.qna.model.vo.Qna;
import org.mybatis.spring.SqlSessionTemplate;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.SearchDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaDao")
public class QnaDao {

	//마이바티스 매퍼파일에 쿼리문 별도로 작성함
	//root-context.xml 에 저장된 마이바티스 연결 객체를 사용해서, 매퍼의 쿼리문을 사용 실행 처리
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//조회수 많은 인기 게시글 3개 Top-3 조회
	
	public ArrayList<Qna> selectTop3(){
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectTop3");
		return (ArrayList<Qna>) list;
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("qnaMapper.selectListCount");
	}

	public ArrayList<Qna> selectList(Paging paging) {
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectList", paging);
		return (ArrayList<Qna>) list;

	}

	public int insertOriginQna(Qna qna) {
		return sqlSessionTemplate.insert("qnaMapper.insertOriginQna", qna);
	}

	public void updateAddReadCount(int qnaNum) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("qnaMapper.updateAddReadCount", qnaNum);
		
	}

	public Qna selectQna(int qnaNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaMapper.selectQna", qnaNum);
	}

	public int updateReplySeq(Qna reply) {
		int result = 0;
		if(reply.getQnaLev() == 2) {
			result = sqlSessionTemplate.update("qnaMapper.updateReplySeq1", reply);
		}
		else if(reply.getQnaLev() == 3) {
			result = sqlSessionTemplate.update("qnaMapper.updateReplySeq2", reply);
		}
	
		return result;
	}

	public int insertReply(Qna reply) {
		int result = 0;
		if(reply.getQnaLev() == 2) {
			result = sqlSessionTemplate.insert("qnaMapper.insertReply1", reply);
		}
		else if(reply.getQnaLev() == 3) {
			result = sqlSessionTemplate.insert("qnaMapper.insertReply2", reply);
		}
	
		return result;
	}

	public int deleteQna(Qna qna) {
		
		return sqlSessionTemplate.delete("qnaMapper.deleteQna", qna);
	}

	public int updateReply(Qna reply) {
		return sqlSessionTemplate.update("qnaMapper.updateReply", reply);
	}
	
	public int updateOrigin(Qna qna) {
		return sqlSessionTemplate.update("qnaMapper.updateOrigin", qna);
	}

	public int selectSearchTitleCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaMapper.selectSearchTitleCount", keyword);
	}

	public int selectSearchWriterCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaMapper.selectSearchWriterCount", keyword);
	}

	public int selectSearchDateCount(SearchDate searchDate) {
		return sqlSessionTemplate.selectOne("qnaMapper.selectSearchDateCount", searchDate);

	}

	public ArrayList<Qna> selectSearchTitle(Search search) {
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectSearchTitle", search);
		return (ArrayList<Qna>) list;
	}
	public ArrayList<Qna> selectSearchWriter(Search search) {
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectSearchWriter", search);
		return (ArrayList<Qna>) list;
	}
	public ArrayList<Qna> selectSearchDate(Search search) {
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectSearchDate", search);
		return (ArrayList<Qna>) list;
	}


	
}
