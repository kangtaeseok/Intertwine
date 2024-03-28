package org.edu.intertwine.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //설정 xml 에 해당 클래스를 Controller 로 자동 등록해 줌
public class FaqController {

	//Faq ListView 페이지 내보개기용
	@RequestMapping("flist.do")
	public String moveFaqListPage() {
		return "faq/faqListView";
	}
}
