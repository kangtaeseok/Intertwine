package org.edu.intertwine.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	@RequestMapping(value = "chatView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String movefriendPage(/* HttpSession session */) {
		/* String userId = (String) session.getAttribute("userId"); */
		/*
		 * String userId = (String) session.getAttribute("userId");
		 * logger.info("Current userId: {}", userId); // Log the userId if (userId ==
		 * null) {
		 */
		return "chat/chatView";

	}
}
