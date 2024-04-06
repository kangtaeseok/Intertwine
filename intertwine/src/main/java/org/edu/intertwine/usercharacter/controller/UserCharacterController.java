package org.edu.intertwine.usercharacter.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.edu.intertwine.usercharacter.model.service.UserCharacterService;
import org.edu.intertwine.usercharacter.model.vo.UserCharacter;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserCharacterController {
	@Autowired
	private UserCharacterService userCharacterService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "mycharacter.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getMyCharacter(@RequestParam("userId") String userId, HttpServletResponse response, HttpSession session) throws IOException {
		// 클라이언트로 부터 요청이 오면, jsonString을 별도의 스트림을 열어서 보낼수도 있고,
		// 또는 뷰 리졸버로 리턴하면 등록된 jsonView 가 받아서 내보낼 수도 있음
		
		UserCharacter userCharacter = userCharacterService.selectUserCharacterFirst(userId);
		
		System.out.println("내가 출력하는거임 UserCharacter " + userCharacter);
	
		if (userCharacter != null) { // 처음 접속은 아닌 경우
			userCharacter = userCharacterService.selectUserCharacter(userId);
			if(userCharacter != null) { // 방이 꾸며져있는 유저의 경우
						
			} else { // 방이 안 꾸며져있는 유저의 경우
				userCharacter = userCharacterService.selectUserCharacterFirst(userId);
				
			}
		} else { // 처음 접속하는 유저의 경우
			userCharacterService.insertUserCharacterFirst(userId);
			userCharacter = userCharacterService.selectUserCharacterFirst(userId);
						
		}
		// 받은 userCharacter 를 JSONObject 에 옮겨 담기 처리
		JSONObject job = new JSONObject();

		job.put("hairStyleImageURL", userCharacter.getHairStyleImageURL());
		job.put("hatImageURL", userCharacter.getHatImageURL());
		job.put("topImageURL", userCharacter.getTopImageURL());
		job.put("bottomImageURL", userCharacter.getBottomImageURL());

		return job.toJSONString();
	}
	
	@RequestMapping(value = "getnickname.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getNickname(@RequestParam("userId") String userId, HttpServletResponse response, HttpSession session) throws IOException {
		// 클라이언트로 부터 요청이 오면, jsonString을 별도의 스트림을 열어서 보낼수도 있고,
		// 또는 뷰 리졸버로 리턴하면 등록된 jsonView 가 받아서 내보낼 수도 있음
		
		String nickname = userService.selectUserNickname(userId);
		
		System.out.println("내가 출력하는거임 nickname " + nickname);
	
		if (nickname == null) { // 닉네임이 없는 경우, 처음 접속 or 별명 수정 안한 경우
			int randomNum = (int) (Math.random() * 10000) + 1;
			nickname = "user" + randomNum; // 닉네임이 null이라고 안뜨게	
		}
		
		// nickname를 JSONObject 에 옮겨 담기 처리
		JSONObject job = new JSONObject();

		job.put("nickname", nickname);

		return job.toJSONString();
	}
	
	
	@RequestMapping(value = "changenickname.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public void changeNickname(@RequestParam("userId") String userId, @RequestParam("renameNickname") String renameNickname, HttpServletResponse response, HttpSession session) throws IOException {
		// 클라이언트로 부터 요청이 오면, jsonString을 별도의 스트림을 열어서 보낼수도 있고,
		// 또는 뷰 리졸버로 리턴하면 등록된 jsonView 가 받아서 내보낼 수도 있음
		User user = new User();
		user.setUserId(userId);
		user.setNickname(renameNickname);
		
		userService.updateUserNickname(user);
	}
}
