package org.edu.intertwine.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@RequestMapping(value = "chatView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView movefriendPage(ModelAndView mv, HttpSession session,
			String friendId) {
		String userId = (String) session.getAttribute("userId");
		mv.addObject("friend", friendId);
		mv.addObject("friend", userId);
		
		return mv;

	}
}
