package org.edu.intertwine;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.edu.intertwine.user.model.vo.NaverLoginAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NaverLoginAuth naverLoginAuth;

	@RequestMapping(value = "/", method = RequestMethod.GET) //    '/'경로로 들어오는 요청을 처리하도록 설정
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	//index.jsp 가 웰컴 요청될 때 포워딩된 요청을 받아서, common/main.jsp 를 내보내기 위한 메소드
	@RequestMapping("login.do")
	public String forwardMainView(Model model,  HttpSession session) {
		String naverAuthURL = naverLoginAuth.getAuthorizationUrl(session);
		model.addAttribute("naverurl", naverAuthURL);
		return "common/login";
	}
	
}

