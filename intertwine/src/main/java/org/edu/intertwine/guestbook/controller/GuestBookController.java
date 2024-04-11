package org.edu.intertwine.guestbook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.edu.intertwine.guestbook.model.service.GuestBookService;
import org.edu.intertwine.guestbook.model.vo.GuestBook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GuestBookController {
	@Autowired
	private GuestBookService guestBookService;

	@RequestMapping(value = "selectguestbook.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String selectGuestBook(@RequestParam("roomHost") String roomHost, HttpServletResponse response) {

		ArrayList<GuestBook> guestbooklist = guestBookService.selectGuestBook(roomHost);

		// response 에 내보낼 값에 대한 mimiType 설정
		response.setContentType("application/json; charset=utf-8");

		// 리턴된 list를 json 배열에 옮겨 담기
		JSONArray jarr = new JSONArray();

		for (GuestBook guestBook : guestbooklist) {
			JSONObject job = new JSONObject();

			job.put("guestBookId", guestBook.getGuestBookId());
			job.put("userId", guestBook.getUserId());
			job.put("writer", guestBook.getWriter());
			job.put("guestbookContent", guestBook.getGuestbookContent());
			job.put("backgroundColor", guestBook.getBackgroundColor());
			
			jarr.add(job);
		}

		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();

		// 전송용 json에 jarr 을 저장함
		sendJson.put("jarr", jarr);
		return sendJson.toJSONString();
	}

	@RequestMapping(value = "insertguestbook.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public int insertGuestBook(
				@RequestParam("roomHost") String roomHost,
				@RequestParam("userId") String userId,
				@RequestParam("guestbookContent") String guestbookContent,
				@RequestParam("backgroundColor") String backgroundColor, HttpServletResponse response) {
		
		GuestBook guestBook = new GuestBook();
		guestBook.setUserId(roomHost);
		guestBook.setWriter(userId);
		guestBook.setGuestbookContent(guestbookContent);
		guestBook.setBackgroundColor(backgroundColor);
		
		int result = guestBookService.insertGuestBook(guestBook);
		
		return result;
	}

}
