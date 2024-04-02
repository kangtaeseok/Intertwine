package org.edu.intertwine.faq.model.service;

import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.dao.FaqDao;
import org.edu.intertwine.faq.model.vo.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("faqService")
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
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return faqDao.selectListCount();
	}

	@Override
	public void updateAddReadCount(int faqNum) {
		faqDao.updateAddReadCount(faqNum);
	}

	@Override
	public Faq selectFaq(int faqNum) {
		// TODO Auto-generated method stub
		return faqDao.selectFaq(faqNum);
	}

	@Override
	public int insertOriginFaq(Faq faq) {
		// TODO Auto-generated method stub
		return faqDao.insertOriginFaq(faq);
	}

	@Override
	public int updateOrigin(Faq faq) {
		// TODO Auto-generated method stub
		return faqDao.updateOrigin(faq);
	}

	@Override
	public int deleteFaq(Faq faq) {
		// TODO Auto-generated method stub
		return faqDao.deleteFaq(faq);
	}

}
