package org.edu.intertwine.userroom.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.vo.Faq;
import org.edu.intertwine.user.model.vo.User;
import org.edu.intertwine.usercharacter.model.vo.UserCharacter;
import org.edu.intertwine.userroom.model.service.UserRoomService;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.edu.intertwine.userroom.model.vo.UserRoomResource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserRoomController {
	// 이 컨트롤러 메소드 들이 잘 구동 되는지, 값이 잘 전달 또는 리턴 되었는지 확인하기 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserRoomController.class);

	@Autowired
	private UserRoomService userRoomService;

	// 뷰 페이지 이동 처리용 --------------------------------------------------------
//	@RequestMapping("startSquare.do")
//	public String maveAjaxPage() {
//		return "square/squareMain";
//	}

	// 스퀘어 첫화면 요청, userId로 방 정보 가져오기
	@RequestMapping(value = "startSquare.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String moveSquarePageMethod(Model model, HttpSession session) {
		User user = null;
		String userId = null;

		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			String attributeName = attributeNames.nextElement();
			Object attributeValue = session.getAttribute(attributeName);
			// "loginUser" 속성일 경우에만 처리
			if ("loginUser".equals(attributeName) && attributeValue instanceof User) {
				// 세션에 저장된 User 객체를 가져와서 캐스팅
				user = (User) attributeValue;

				userId = user.getUserId();
			}
		}

		UserRoom userRoom = userRoomService.selectUserRoomFirst(userId);

		System.out.println("내가 출력하는거임 UserRoom " + userRoom);

		if (userRoom != null) { // 처음 접속은 아닌 경우
			userRoom = userRoomService.selectUserRoom(userId);
			if(userRoom != null) { // 방이 꾸며져있는 유저의 경우
				model.addAttribute("userRoom", userRoom);		
			} else { // 방이 안 꾸며져있는 유저의 경우
				userRoom = userRoomService.selectUserRoomFirst(userId);
				model.addAttribute("userRoom", userRoom);
			}
		} else { // 처음 접속하는 유저의 경우
			userRoomService.insertUserRoomFirst(userId);
			userRoom = userRoomService.selectUserRoomFirst(userId);
			model.addAttribute("userRoom", userRoom);				
		}
		return "square/squareMain";
	}

	
	@RequestMapping(value = "getallroomreosource.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getAllRoomResource(HttpServletResponse response)
			throws IOException {
		
		// 전달받은 키워드로 공지사항 제목 검색 메소드를 실행하고 결과받기
		ArrayList<UserRoomResource> roomresourcelist = userRoomService.selectAllRoomResource();
		
		// response 에 내보낼 값에 대한 mimiType 설정
		response.setContentType("application/json; charset=utf-8");

		// 리턴된 list를 json 배열에 옮겨 담기
		JSONArray jarr = new JSONArray();

		for (UserRoomResource userRoomResource : roomresourcelist) {
			JSONObject job = new JSONObject();
			
			job.put("resourceId", userRoomResource.getResourceId());
			job.put("resourceURL", userRoomResource.getResourceURL());

			jarr.add(job);
		} 

		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		// 전송용 json에 jarr 을 저장함
		sendJson.put("jarr", jarr);
		return sendJson.toJSONString();
	}
}
