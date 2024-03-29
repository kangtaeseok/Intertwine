package org.edu.intertwine.faq.model.service;

import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.vo.Faq;

public interface FaqService {
	ArrayList<Faq> selectTop3();
	ArrayList<Faq> selectList(Paging paging);
}
