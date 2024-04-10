package org.edu.intertwine.userroom.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.post.model.service.PostService;
import org.edu.intertwine.post.model.vo.Gallery;
import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.MyPage;
import org.edu.intertwine.user.model.vo.User;
import org.edu.intertwine.userroom.model.service.UserRoomService;
import org.edu.intertwine.userroom.model.vo.InsertUserRoomParam;
import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.edu.intertwine.userroom.model.vo.UserRoomResource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserRoomController {
	// 이 컨트롤러 메소드 들이 잘 구동 되는지, 값이 잘 전달 또는 리턴 되었는지 확인하기 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserRoomController.class);

	@Autowired
	private UserRoomService userRoomService;

	@Autowired
	private FriendService friendService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;

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

		if (userRoom != null) { // 처음 접속은 아닌 경우
			userRoom = userRoomService.selectUserRoom(userId);
			if (userRoom != null) { // 방이 꾸며져있는 유저의 경우
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
	public String getAllRoomResource(HttpServletResponse response) throws IOException {

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

	@RequestMapping(value = "changemyroomcolor.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public void changeMyRoomColor(@RequestParam("userId") String userId,
			@RequestParam("previewbackgroundColor") String previewbackgroundColor, HttpServletResponse response)
			throws IOException {

		UserRoom userRoom = new UserRoom(userId, previewbackgroundColor);
		int result = userRoomService.updateUserRoom(userRoom);

		if (result > 0) {
			System.out.println("방 컬러 수정 성공");
		}
	}

	@RequestMapping(value = "changemyroom.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public ResponseEntity<?> changeMyRoom(@RequestBody InsertUserRoomParam insertUserRoomParam) {
		try {
			// 먼저 기존의 사용자 방 정보를 삭제합니다.
			int delResult = userRoomService.deleteUserRoom(insertUserRoomParam.getUserId());

			// 새로운 사용자 방 정보를 저장합니다.
			insertUserRoomParam.getItems().forEach(item -> {
				userRoomService.insertUserRoom(insertUserRoomParam.getUserId(), item);
			});

			// 성공 응답을 클라이언트에 전송합니다.
			return ResponseEntity.ok().body("방 수정 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			// 실패 응답을 클라이언트에 전송합니다.
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("방 수정 실패");
		}
	}

	@RequestMapping(value = "getfriendlist.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String getFriendList(@RequestParam("userId") String userId, HttpServletResponse response) {

		ArrayList<Friend> friendList = friendService.selectFollowingList(userId);
		JSONArray jsonFriendArray = new JSONArray();

		for (Friend friend : friendList) {
			JSONObject jsonFriend = new JSONObject();
			jsonFriend.put("friendId", friend.getFriendId());

			MyPage myPage = userService.selectMyPage(friend.getFriendId());
			if (myPage != null) {
				jsonFriend.put("profile", myPage.getProfile()); // 프로필 이미지 URL 추가
			} else {
				//jsonFriend.put("profile", "defaultProfile.png"); // 프로필이 없는 경우 기본 이미지
			}

			jsonFriendArray.add(jsonFriend);
		}

		JSONObject job = new JSONObject();
		job.put("friends", jsonFriendArray);

		response.setContentType("application/json; charset=utf-8");
		return job.toString();
	}

	@RequestMapping(value = "getmyroom.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String getMyRoom(@RequestParam("userId") String userId, HttpServletResponse response) {

		UserRoom userRoom = userRoomService.selectUserRoom(userId);

		// response에 내보낼 값에 대한 mimeType 설정
		response.setContentType("application/json; charset=utf-8");

		JSONObject job = new JSONObject();
		if (userRoom != null) {
			job.put("userId", userRoom.getUserId());
			job.put("roomColor", userRoom.getRoomColor());
			job.put("guestBookOpen", userRoom.getGuestBookOpen());

			// UserRoomResource 리스트를 JSON 배열로 변환
			JSONArray rListJson = new JSONArray();
			for (UserRoomResource resource : userRoom.getrList()) {
				JSONObject resourceJson = new JSONObject();
				resourceJson.put("resourceId", resource.getResourceId());
				resourceJson.put("resourcePositionX", resource.getResourcePositionX());
				resourceJson.put("resourcePositionY", resource.getResourcePositionY());
				resourceJson.put("resourceRotation", resource.getResourceRotation());
				resourceJson.put("resourceScale", resource.getResourceScale());
				resourceJson.put("resourceName", resource.getResourceName());
				resourceJson.put("resourceURL", resource.getResourceURL());

				rListJson.add(resourceJson);
			}
			job.put("rList", rListJson);
		}

		return job.toJSONString();
	}

	@RequestMapping(value = "movetofriendroom.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String moveToFriendRoom(@RequestParam("friendId") String friendId, HttpServletResponse response) {

		UserRoom userRoom = userRoomService.selectUserRoom(friendId);

		JSONObject job = new JSONObject();
		if (userRoom != null) {
			job.put("userId", userRoom.getUserId());
			job.put("roomColor", userRoom.getRoomColor());
			job.put("guestBookOpen", userRoom.getGuestBookOpen());

			// UserRoomResource 리스트를 JSON 배열로 변환
			JSONArray rListJson = new JSONArray();
			for (UserRoomResource resource : userRoom.getrList()) {
				JSONObject resourceJson = new JSONObject();
				resourceJson.put("resourceId", resource.getResourceId());
				resourceJson.put("resourcePositionX", resource.getResourcePositionX());
				resourceJson.put("resourcePositionY", resource.getResourcePositionY());
				resourceJson.put("resourceRotation", resource.getResourceRotation());
				resourceJson.put("resourceScale", resource.getResourceScale());
				resourceJson.put("resourceName", resource.getResourceName());
				resourceJson.put("resourceURL", resource.getResourceURL());

				rListJson.add(resourceJson);
			}
			job.put("rList", rListJson);
		}

		return job.toJSONString();
	}
	
	
	@RequestMapping(value = "getimagebyuserid.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String getImageByUserId(@RequestParam("roomHost") String roomHost, HttpServletResponse response) {
	    ArrayList<Post> posts = postService.selectPostsById(roomHost);
	    JSONArray imagesJsonArray = new JSONArray(); // 이미지 URL을 담을 JSON 배열 생성

	    if (posts != null) {
	        for (Post post : posts) {
	            Image image = postService.selectOneImage(post.getPostId());
	            if (image != null) {
	                // 각 이미지의 URL만을 추출하여 JSON 배열에 추가
	                JSONObject imageJson = new JSONObject();
	                imageJson.put("imageURL", image.getImageURL());
	                imagesJsonArray.add(imageJson);
	            }
	        }
	    }

	    JSONObject job = new JSONObject();
	    job.put("images", imagesJsonArray); // 생성된 JSON 배열을 최종 JSON 객체에 추가

	    return job.toJSONString(); // JSON 객체를 문자열로 변환하여 반환
	}

}
