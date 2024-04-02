package org.edu.intertwine.qna.model.service;

import java.util.ArrayList;

import org.edu.intertwine.qna.model.vo.Qna;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.SearchDate;

public interface QnaService {
	ArrayList<Qna> selectTop3();

	int selectListCount();
	ArrayList<Qna> selectList(Paging paging);
	int insertOriginQna(Qna qna);

	void updateAddReadCount(int qnaNum);

	Qna selectQna(int qnaNum);

	int updateReplySeq(Qna reply);// 댓글의 순번을 1씩 증가

	int insertReply(Qna reply);

	int deleteQna(Qna qna);

	int updateReply(Qna reply);
	
	int updateOrigin(Qna qna);

	int selectSearchTitleCount(String keyword);

	int selectSearchWriterCount(String keyword);

	int selectSearchDateCount(SearchDate searchDate);

	ArrayList<Qna> selectSearchTitle(Search search);
	ArrayList<Qna> selectSearchWriter(Search search);
	ArrayList<Qna> selectSearchDate(Search search);
	
}
