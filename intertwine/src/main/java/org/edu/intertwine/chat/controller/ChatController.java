package org.edu.intertwine.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.edu.intertwine.chat.model.service.ChatService;
import org.edu.intertwine.chat.model.vo.Chat;
import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@Autowired
	private UserService userService;

	@Autowired
	private FriendService friendService;

	@Autowired
	private ChatService chatService;

	// 친구목록에서 채팅 페이지 이동 메소드
	@RequestMapping(value = "chatView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveChatPage(ModelAndView mv, HttpSession session, String otherUserId) {
		User loginUser = (User) session.getAttribute("loginUser");
		User otherUser = userService.selectUser(otherUserId);

		Chat chat = new Chat();
		chat.setUserId1(loginUser.getUserId());
		/* chat.setUserId2(otherUserId); */
		ArrayList<Chat> myAllChatRoomList = chatService.selectAllChatRoomList(chat);
		
		if (myAllChatRoomList == null) {
			myAllChatRoomList = new ArrayList<Chat>();
		}

		mv.addObject("ChatList", myAllChatRoomList);
		mv.addObject("otherUser", otherUser.getUserId());
		mv.addObject("loginUser", loginUser.getUserId());
		mv.setViewName("chat/chatView");
		return mv;	
	}

	// 메인에서 채팅 페이지 이동 메소드
	@RequestMapping(value = "chatViewMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveChatPageMain(ModelAndView mv, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		Chat chat = new Chat();
		chat.setUserId1(loginUser.getUserId());

		ArrayList<Chat> myAllChatRoomList = chatService.selectAllChatRoomList(chat);
		if (myAllChatRoomList == null) {
			ArrayList<Chat> myAllChatRoomList1 = new ArrayList<Chat>();
		}
		mv.addObject("ChatList", myAllChatRoomList);
		mv.addObject("loginUser", loginUser.getUserId());
		mv.setViewName("chat/chatView");
		return mv;
	}

	// 채팅방 생성 메소드
	@RequestMapping(value = "insertChat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertChatRoom(String otherUserId, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		User otherUser = userService.selectUser(otherUserId);
		Chat chat = new Chat();
		chat.setUserId1(loginUser.getUserId());
		chat.setUserId2(otherUserId);
		int originalChatRoom = chatService.selectOneChatRoom(chat);
		
		// 기존 채팅방이 있는지 서비스에서 조회해 와 있는경우
		if (originalChatRoom > 0) {
			return "redirect:/chatView.do?otherUserId=" + otherUserId;
		} else {
			// 기존 채팅방이 없는 경우
			// 채팅방 생성 메소드 호출
			int newChatRoom = chatService.insertChatRoom(chat);
			return "redirect:chatView.do?otherUserId=" + otherUserId;
		}

	}

	// 채팅방 나가기 메소드
	@RequestMapping(value = "deleteChat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteChatRoom(String otherUserId, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		User otherUser = userService.selectUser(otherUserId);
		Chat chat = new Chat();
		chat.setUserId1(loginUser.getUserId());
		chat.setUserId2(otherUserId);
		chatService.deleteChatRoom(chat);
		return "redirect:chatViewMain.do";
	}
	
	
	
		

	

}





























