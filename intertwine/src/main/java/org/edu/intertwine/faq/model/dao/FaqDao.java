package org.edu.intertwine.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.vo.Faq;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqDao {

	
	@Autowired   //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//새 공지글 3개를 리턴 : 작성날짜로 top-3 분석 이용함
	public ArrayList<Faq> selectTop3(){
		List<Faq> list = sqlSessionTemplate.selectList("faqMapper.selectTop3");
		return (ArrayList<Faq>)list;
	}


	public ArrayList<Faq> selectList(Paging paging) {
		List<Faq> list = sqlSessionTemplate.selectList("faqMapper.selectList", paging);
		return (ArrayList<Faq>) list;
	}


	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("faqMapper.selectListCount");
	}


	public Faq selectFaq(int faqNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("faqMapper.selectFaq", faqNum);
	}


	public void updateAddReadCount(int faqNum) {
		sqlSessionTemplate.update("faqMapper.updateAddReadCount", faqNum);
	
		
	}


	public int insertOriginFaq(Faq faq) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("faqMapper.insertOriginFaq", faq);
	}
	


}
