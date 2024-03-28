package org.edu.intertwine.faq.model.service;

import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.dao.FaqDao;
import org.edu.intertwine.faq.model.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public ArrayList<Faq> selectTop3() {
		// TODO Auto-generated method stub
		return faqDao.selectTop3();
	}
	
	@Override
	public ArrayList<Faq> selectList(Paging paging) {
		// TODO Auto-generated method stub
		return faqDao.selectList(paging);
	}

}
