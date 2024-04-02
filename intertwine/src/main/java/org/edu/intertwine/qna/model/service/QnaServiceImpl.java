package org.edu.intertwine.qna.model.service;

import java.util.ArrayList;

import org.edu.intertwine.qna.model.dao.QnaDao;
import org.edu.intertwine.qna.model.vo.Qna;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.SearchDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	

	@Autowired
	private QnaDao qnaDao;

	@Override
	public ArrayList<Qna> selectTop3() {
		// TODO Auto-generated method stub
		return qnaDao.selectTop3();
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectListCount();
	}

	@Override
	public ArrayList<Qna> selectList(Paging paging) {
		// TODO Auto-generated method stub
		return qnaDao.selectList(paging);
	}

	@Override
	public int insertOriginQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.insertOriginQna(qna);
	}

	@Override
	public void updateAddReadCount(int qnaNum) {
		// TODO Auto-generated method stub
		qnaDao.updateAddReadCount(qnaNum);
	}

	@Override
	public Qna selectQna(int qnaNum) {
		// TODO Auto-generated method stub
		return qnaDao.selectQna(qnaNum);
	}

	@Override
	public int updateReplySeq(Qna reply) {
		// TODO Auto-generated method stub
		return qnaDao.updateReplySeq(reply);
	}

	@Override
	public int insertReply(Qna reply) {
		// TODO Auto-generated method stub
		return qnaDao.insertReply(reply);
	}

	@Override
	public int deleteQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.deleteQna(qna);
	}

	@Override
	public int updateReply(Qna reply) {
		// TODO Auto-generated method stub
		return qnaDao.updateReply(reply);
	}

	@Override
	public int updateOrigin(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.updateOrigin(qna);
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		// TODO Auto-generated method stub
		return qnaDao.selectSearchTitleCount(keyword);
	}
	
	@Override
	public int selectSearchWriterCount(String keyword) {
		// TODO Auto-generated method stub
		return qnaDao.selectSearchWriterCount(keyword);
	}

	@Override
	public int selectSearchDateCount(SearchDate searchDate ) {
		return qnaDao.selectSearchDateCount(searchDate);
	}

	@Override
	public ArrayList<Qna> selectSearchTitle(Search search) {
		return qnaDao.selectSearchTitle(search);
	}
	@Override
	public ArrayList<Qna> selectSearchWriter(Search search) {
		return qnaDao.selectSearchWriter(search);
	}
	@Override
	public ArrayList<Qna> selectSearchDate(Search search) {
		return qnaDao.selectSearchDate(search);
	}
}
