
package org.edu.intertwine.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FriendController { // 로그 객체 생성 (메소드 동작 확인 및 전달값, 리턴값확인)
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);

	// 서비스측과 연결 처리함 (의존성 주입)

	@Autowired
	private FriendService friendService;

	@Autowired
	private UserService userService;

	// 친구페이지 뷰 내보내기
	@RequestMapping(value = "friendPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String movefriendPage(Model model, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		logger.info("loginUser:" + loginUser);
		ArrayList<Friend> followinglist = friendService.FollowingList(loginUser.getUserId());
		model.addAttribute("followingList", followinglist);
		ArrayList<Friend> followerlist = friendService.FollowerList(loginUser.getUserId());
		model.addAttribute("followerList", followerlist);
		return "friend/friendMainView";

	}

	// 로그인 세션 동작 확인 테스트용
	@PostMapping("test.do")
	@ResponseBody // HTTP 응답 바디에 직접 데이터를 작성하기 위해 사용
	public String receiveUserId(@RequestParam("userId") String userId) {
		System.out.println("Received userId: " + userId);
		return "Received userId: " + userId; // 클라이언트로 응답 보내기
	}

	// 차단 페이지 뷰 내보내기blockedPage.do
	@RequestMapping(value = "blockedPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String blockedPage() {
		return "friend/blockedViewPage";
	}

	// 팔로잉 추가 메소드
//	@PostMapping("insertF.do")
//	@ResponseBody
//	public String addFollowing(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId) {
//		// vo 객체 생성 및 객체 변수에 들어온 유저 정보로 수정
//		Friend friend = new Friend();
//		friend.setUserId(userId);
//		friend.setFriendId(friendId);
//		System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
//		int response = friendService.insertFollowing(friend);
//		return String.valueOf(response);
//
//	}
	@PostMapping("insertF.do")
	public String addFollowing(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId, HttpSession session) {
	    Friend friend = new Friend();
	    friend.setUserId(userId);
	    friend.setFriendId(friendId);
	    System.out.println("userId:" + userId + "friendId : " + friendId);
	    logger.info("userId:" + userId + "friendId : " + friendId);
	    try {
	        int response = friendService.insertFollowing(friend);
	        if(response > 0) {
	            session.setAttribute("followMessage", "팔로우 성공!");
	        } else {
	            session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
	        }
	    } catch (Exception e) {
	        session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
	    }
	    return "redirect:friendPage.do";
	}

	// 팔로잉 취소 메소드
	@PostMapping("unfollowing.do")
	public String unfollowing(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId, HttpSession session) {
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setFriendId(friendId);
		System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
		 logger.info("userId:" + userId + "friendId : " + friendId + "ㅇ");
		   try {
		int response = friendService.deleteFollowing(friend);
		if(response > 0) {
			session.setAttribute("dfollowMessage", "팔로우 취소!");
		}else {
			session.setAttribute("dfollowMessage", "이미 팔로우 취소 했거나 오류 발생");
		}
		   }catch(Exception e) {
			   logger.error("팔로우 취소 처리 중 오류 발생", e);
			   session.setAttribute("dfollowMessage", "서버 오류로 인해 팔로우취소 처리를 완료하지 못했습니다.");
		}
			
		return "redirect:friendPage.do";
	}

	// 차단계정 목록 조회

	// 팔로잉 차단 메소드
	@PostMapping("blockFollowing.do")
	@ResponseBody
	public ResponseEntity<String> blockFollowing(@RequestParam("userId") String userId,
			@RequestParam("friendId") String friendId) {
		try {
			Friend friend = new Friend();
			friend.setUserId(userId);
			friend.setFriendId(friendId);
			friendService.blockFollowing(friend);
			return ResponseEntity.ok("팔로우 한 계정이 차단되었습니다.");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("팔로우 계정 차단을 실패하였습니다.");
		}
	}

	// 팔로워 차단 메소드
	/*
	 * @PostMapping("unfollow.do")
	 * 
	 * 
	 * @RequestMapping public ResponseEntity<String>
	 * blockFollower(@RequestParam("userId") String
	 * userId, @RequestParam("friendId") String friendId){
	 * 
	 * }
	 */

	@GetMapping("countFollowing.do")
	@ResponseBody
	public String countFollowing(@RequestParam("userId") String userId) {
		int followeringCount = friendService.countFollowing(userId);
		return String.valueOf(followeringCount);
	}

	// 팔로워 수
	@GetMapping("countFollowers.do")
	@ResponseBody
	public String countFollowers(@RequestParam("userId") String userId) {
		int followersCount = friendService.countFollowers(userId);
		return String.valueOf(followersCount);
	}

	/*
	 * // 팔로잉 목록 불러오기
	 * 
	 * @PostMapping("FollowingList.do")
	 * 
	 * @ResponseBody public ArrayList<Friend>
	 * selectFollowingList(@RequestParam("userId") String userId) {
	 * ArrayList<Friend> flist = friendService.FollowingList(userId);
	 * ArrayList<Friend> fflist = friendService.friendProfile(Follow profile);
	 * for(Friend list : flist) { JSONObject job = new JSONObject();
	 * 
	 * job.put("profile", flist) }
	 * 
	 * return flist;
	 * 
	 * 
	 * }
	 */

	// 팔로잉 중인 계정 검색 1 (비동기로 가려했는데 friendId 출력안되서 철수)
//	@RequestMapping("searchFollowing.do")
//
//	@ResponseBody
//	public String searchFollowingMethod(
//
//			@RequestParam("userId") String userId, @RequestParam("friendId") String friendId) {
//		System.out.println("userId: " + userId + ", friendId: " + friendId);
//		Friend friend = new Friend();
//		friend.setUserId(userId);
//		friend.setFriendId(friendId);
//		JSONArray jarr = new JSONArray();
//		ArrayList<Friend> searchResults = friendService.searchFollowing(friend);
//		for (Friend friendlist : searchResults) {
//			JSONObject job = new JSONObject();
//			job.put("friendId", friendlist.getFriendId());
//			jarr.add(job);
//		}
//		JSONObject sendJson = new JSONObject();
//		sendJson.put("searchlist", jarr);
//		return sendJson.toJSONString();
//	}

//	// 팔로잉 중인 계정 검색 2
		@RequestMapping("searchFollowing.do")
		public String searchFollowingMethod(Model model, HttpSession session,
				@RequestParam("keyword") String keyword) {
			User loginUser = (User)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			 logger.info("loginUser:" + loginUser);
			 Friend friend = new Friend();
			 friend.setUserId(userId);
			 friend.setKeyword(keyword);
		      ArrayList<Friend> searchF = friendService.searchFollowing(friend);
		    	  model.addAttribute("searchF", searchF);
		    	  if(searchF != null) {
		    	  return "friend/friendMainView";
		    	  }else {
		    		  return "redirect:friendPage.do";
		    	  }
		}

	//팔로워 계정 검색 
		@RequestMapping("searchFollower.do")
		public String searchFollowerMethod(Model model, HttpSession session,
				@RequestParam("keyword") String keyword) {
			User loginUser = (User)session.getAttribute("loginUser");
			String userId = loginUser.getUserId();
			 logger.info("loginUser:" + loginUser);
			 Friend friend = new Friend();
			 friend.setUserId(userId);
			 friend.setKeyword(keyword);
		      ArrayList<Friend> searchFwer = friendService.searchFollower(friend);
		    	  model.addAttribute("searchFwer", searchFwer);
		    	  
		    	  return "friend/friendMainView";
		}
}
