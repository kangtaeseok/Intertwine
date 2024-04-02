//
//package org.edu.intertwine.friend.controller;
//
//import java.util.ArrayList;
//
//import org.edu.intertwine.friend.model.service.FriendService;
//import org.edu.intertwine.friend.model.vo.Friend;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//@Controller
//public class FriendController { // 로그 객체 생성 (메소드 동작 확인 및 전달값, 리턴값확인)
//	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
//
//	// 서비스측과 연결 처리함 (의존성 주입)
//
//	@Autowired
//	private FriendService friendService;
//
//	// 친구페이지 뷰 내보내기
//	@RequestMapping(value = "friendPage.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String movefriendPage() {
//		return "friend/friendMainView";
//	}
//	
//	//차단 페이지 뷰 내보내기blockedPage.do
//	@RequestMapping(value = "blockedPage.do", method = { RequestMethod.GET, RequestMethod.POST })
//	    public String blockedPage() {
//	        return "friend/blockedViewPage"; 
//	    }
//
//	// 팔로잉 추가 메소드
//	@PostMapping("insertF.do")
//	@ResponseBody
//	public ResponseEntity<String> addFollowing(@RequestParam("userId") String userId,
//			@RequestParam("friendId") String friendId) {
//		try {
//			// vo 객체 생성 및 객체 변수에 들어온 유저 정보로 수정
//			Friend friend = new Friend();
//			friend.setUserId(userId);
//			friend.setFriendId(friendId);
//			friendService.insertFollowing(friend);
//			return ResponseEntity.ok().body("팔로잉 성공");
//		} catch (Exception e) {
//
//			return ResponseEntity.badRequest().body("팔로잉 실패");
//		}
//	}
//
//	/*
//	 * @RequestMapping(value="insertF.do", method=RequestMethod.POST) public String
//	 * addFollowing(@RequestParam("userId") String userId, @RequestParam("friendId")
//	 * String friendId) { logger.info("팔로잉 추가 : User {} -> Friend {}", userId,
//	 * friendId);
//	 * 
//	 * Friend friend = new Friend(); friend.setUserId(userId);
//	 * friend.setFriendId(friendId); friend.setStatus("accepted");
//	 * friendService.insertFollowing(friend); return "redirect:/friendPage.do";
//	 * 
//	 * 
//	 * }
//	 */
//
//	// 팔로잉 취소 메소드
//	@PostMapping("unfollowing.do")
//	@ResponseBody
//	public ResponseEntity<String> unfollowing(@RequestParam("userId") String userId,
//			@RequestParam("friendId") String friendId) {
//
//		try {
//			Friend friend = new Friend();
//			friend.setUserId(userId);
//			friend.setFriendId(friendId);
//			// 언팔로잉 서비스 메소드 호출
//			friendService.deleteFollowing(friend);
//			// 성공 응답
//			return ResponseEntity.ok().body("팔로잉 취소하였습니다.");
//		} catch (Exception e) {
//			// 실패 응답
//			return ResponseEntity.badRequest().body("팔로잉 취소를 실패하였습니다.");
//		}
//	}
//
//	// 팔로잉 차단 메소드
//	@PostMapping("blockFollowing.do")
//	@ResponseBody
//	public ResponseEntity<String> blockFollowing(@RequestParam("userId") String userId,
//			@RequestParam("friendId") String friendId) {
//		try {
//			Friend friend = new Friend();
//			friend.setUserId(userId);
//			friend.setFriendId(friendId);
//			// 차단 상태 설정은 서비스 레이어 또는 매퍼에서 수행할 수 있습니다.
//			friendService.blockFollowing(friend);
//			return ResponseEntity.ok("팔로우 한 계정이 차단되었습니다.");
//		} catch (Exception e) {
//			return ResponseEntity.badRequest().body("팔로우 계정 차단을 실패하였습니다.");
//		}
//	}
//
//	// 팔로워 차단 메소드
//	/*
//	 * @PostMapping("unfollow.do")
//
//	 * 
//	 * @RequestMapping public ResponseEntity<String>
//	 * blockFollower(@RequestParam("userId") String
//	 * userId, @RequestParam("friendId") String friendId){
//	 * 
//	 * }
//	 */
//
//	// 팔로잉 수
//	@GetMapping("countFollowing.do")
//	@ResponseBody
//	public int countFollowing(@RequestParam("userId") String userId) {
//
//		return friendService.countFollowing(userId);
//	}
//
//	// 팔로워 수
//	@GetMapping("countFollowers.do")
//	@ResponseBody
//	public int countFollowers(@RequestParam("userId") String userId) {
//		return friendService.countFollowers(userId);
//	}
//
//	/*
//	 * // 팔로잉 목록 불러오기
//	 * 
//	 * @PostMapping("FollowingList.do")
//	 * 
//	 * @ResponseBody public ArrayList<Friend>
//	 * selectFollowingList(@RequestParam("userId") String userId) {
//	 * 
//	 * }
//	 * 
//	 * // 팔로워 목록 불러오기
//	 * 
//	 * @PostMapping("FollowerList.do")
//	 * 
//	 * @ResponseBody public ArrayList<Friend>
//	 * selectFollowerList(@RequestParam("userId") String userId) {
//	 * 
//	 * }
//	 */
//
//}
