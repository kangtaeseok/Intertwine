package org.edu.intertwine.usercharacter.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.edu.intertwine.usercharacter.model.service.UserCharacterService;
import org.edu.intertwine.usercharacter.model.vo.UserCharacter;
import org.json.simple.JSONArray;
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

	@RequestMapping(value = "getmycharacter.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getMyCharacter(@RequestParam("userId") String userId, HttpServletResponse response,
			HttpSession session) throws IOException {
		UserCharacter userCharacter = userCharacterService.selectUserCharacterFirst(userId);// 접속했던 유저인지 확인

		if (userCharacter != null) { // 처음 접속은 아닌 경우
			userCharacter = userCharacterService.selectUserCharacter(userId); // 캐릭터 정보 조회
			
		} else { // 처음 접속하는 유저의 경우
			int result = userCharacterService.insertUserCharacterFirst(userId); // default값으로 insert
			if (result > 0) {
				userCharacter = userCharacterService.selectUserCharacter(userId); // 캐릭터 정보 조회
			}
		}
		// 받은 userCharacter 를 JSONObject 에 옮겨 담기 처리
		JSONObject job = new JSONObject();

		job.put("hairStyleImageURL", userCharacter.getHairStyleImageURL()); // 캐릭터 헤어 리소스 저장위치
		job.put("hatImageURL", userCharacter.getHatImageURL()); // 캐릭터 모자 리소스 저장위치
		job.put("topImageURL", userCharacter.getTopImageURL()); // 캐릭터 상의 리소스 저장위치
		job.put("bottomImageURL", userCharacter.getBottomImageURL()); // 캐릭터 하의 리소스 저장위치

		return job.toJSONString();
	}

	@RequestMapping(value = "getcharacterreosource.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getCharacterResource(@RequestParam("userId") String userId, HttpServletResponse response)
			throws IOException {
		UserCharacter userCharacter = userCharacterService.selectUserCharacter(userId);
		JSONObject cjob = new JSONObject();

		cjob.put("hairStyleImageURL", userCharacter.getHairStyleImageURL());
		cjob.put("hatImageURL", userCharacter.getHatImageURL());
		cjob.put("topImageURL", userCharacter.getTopImageURL());
		cjob.put("bottomImageURL", userCharacter.getBottomImageURL());

		// 전달받은 키워드로 공지사항 제목 검색 메소드를 실행하고 결과받기
		ArrayList<UserCharacter> hairlist = userCharacterService.selectUserCharacterHair();
		ArrayList<UserCharacter> hatlist = userCharacterService.selectUserCharacterHat();
		ArrayList<UserCharacter> toplist = userCharacterService.selectUserCharactertop();
		ArrayList<UserCharacter> bottomlist = userCharacterService.selectUserCharacterbottom();

		// response 에 내보낼 값에 대한 mimiType 설정
		response.setContentType("application/json; charset=utf-8");

		// 리턴된 list를 json 배열에 옮겨 담기
		JSONArray hairjarr = new JSONArray();
		JSONArray hatjarr = new JSONArray();
		JSONArray topjarr = new JSONArray();
		JSONArray bottomjarr = new JSONArray();

		for (UserCharacter tmpUserCharacter : hairlist) {
			JSONObject job = new JSONObject();

			job.put("hairId", tmpUserCharacter.getHairStyleId());
			job.put("hairImageURL", tmpUserCharacter.getHairStyleImageURL());

			hairjarr.add(job);
		}
		for (UserCharacter tmpUserCharacter : hatlist) {
			JSONObject job = new JSONObject();

			job.put("hatId", tmpUserCharacter.getHatId());
			job.put("hatImageURL", tmpUserCharacter.getHatImageURL());

			hatjarr.add(job);
		}
		for (UserCharacter tmpUserCharacter : toplist) {
			JSONObject job = new JSONObject();

			job.put("topId", tmpUserCharacter.getTopId());
			job.put("topImageURL", tmpUserCharacter.getTopImageURL());

			topjarr.add(job);
		}
		for (UserCharacter tmpUserCharacter : bottomlist) {
			JSONObject job = new JSONObject();

			job.put("bottomId", tmpUserCharacter.getBottomId());
			job.put("bottomImageURL", tmpUserCharacter.getBottomImageURL());

			bottomjarr.add(job);
		}

		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();

		// 전송용 json에 jarr 을 저장함
		sendJson.put("mycharacter", cjob);
		sendJson.put("hairjarr", hairjarr);
		sendJson.put("hatjarr", hatjarr);
		sendJson.put("topjarr", topjarr);
		sendJson.put("bottomjarr", bottomjarr);

		return sendJson.toJSONString();
	}

	@RequestMapping(value = "changemycharacter.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public void changeMyCharacter(@RequestParam("userId") String userId, @RequestParam("hairId") String hairId,
			@RequestParam("hatId") String hatId, @RequestParam("topId") String topId,
			@RequestParam("bottomId") String bottomId, HttpServletResponse response) throws IOException {

		UserCharacter userCharacter = new UserCharacter(userId, hairId, hatId, topId, bottomId);

		int result = userCharacterService.updateUserCharacter(userCharacter);

		if (result == 1) {
			System.out.println("캐릭터 변경 성공!");
		}
	}

	@RequestMapping(value = "getnickname.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String getNickname(@RequestParam("userId") String userId, HttpServletResponse response, HttpSession session)
			throws IOException {
		String nickname = userService.selectUserNickname(userId);

		if (nickname == null) { // 닉네임이 없는 경우, 처음 접속 or 별명 수정 안한 경우
			int randomNum = (int) (Math.random() * 10000) + 1;
			nickname = "USER" + randomNum; // 닉네임이 null이라고 안뜨게 USER랜덤숫자로 출력
		}

		// nickname를 JSONObject 에 옮겨 담기 처리
		JSONObject job = new JSONObject();

		job.put("nickname", nickname);

		return job.toJSONString();
	}

	@RequestMapping(value = "changenickname.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public void changeNickname(@RequestParam("userId") String userId,
			@RequestParam("renameNickname") String renameNickname, HttpServletResponse response, HttpSession session)
			throws IOException {
		User user = new User();
		user.setUserId(userId);
		user.setNickname(renameNickname);

		userService.updateUserNickname(user);
	}
}
