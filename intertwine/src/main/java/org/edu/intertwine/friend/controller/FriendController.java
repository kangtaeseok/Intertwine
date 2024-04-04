
package org.edu.intertwine.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.user.model.service.UserService;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
   private UserService UserService;

   // 친구페이지 뷰 내보내기
   @RequestMapping(value = "friendPage.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String movefriendPage(/* HttpSession session */) {
      /* String userId = (String) session.getAttribute("userId"); */
      /*
       * String userId = (String) session.getAttribute("userId");
       * logger.info("Current userId: {}", userId); // Log the userId if (userId ==
       * null) {
       */
      return "friend/friendMainView";

   }

   // 로그인 세션 동작 확인 테스트용
   @PostMapping("test.do")
   @ResponseBody // HTTP 응답 바디에 직접 데이터를 작성하기 위해 사용
   public String receiveUserId(@RequestParam("userId") String userId) {
      System.out.println("Received userId: " + userId);

      // 비즈니스 로직 처리...

      return "Received userId: " + userId; // 클라이언트로 응답 보내기
   }

   // 차단 페이지 뷰 내보내기blockedPage.do
   @RequestMapping(value = "blockedPage.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String blockedPage() {
      return "friend/blockedViewPage";
   }

   // 팔로잉 추가 메소드
   @PostMapping("insertF.do")
   @ResponseBody
   public String addFollowing(@RequestParam("userId") String userId, 
         @RequestParam("friendId") String friendId) {
         // vo 객체 생성 및 객체 변수에 들어온 유저 정보로 수정
      Friend friend = new Friend();
        friend.setUserId(userId);
        friend.setFriendId(friendId);
         System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
         friendService.insertFollowing(friend);
         return "팔로잉 성공!";

   }

   // 팔로잉 취소 메소드
   @PostMapping("unfollowing.do")
   @ResponseBody
   public String unfollowing(@RequestParam("userId") String userId,
         @RequestParam("friendId") String friendId) {
      Friend friend = new Friend();
      friend.setUserId(userId);
        friend.setFriendId(friendId);
        System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
      friendService.deleteFollowing(friend);
      String cansle = "팔로잉 취소";
      return cansle;
   }
   
   //차단계정 목록 조회
   
   

   // 팔로잉 차단 메소드
   @PostMapping("blockFollowing.do")
   @ResponseBody
   public ResponseEntity<String> blockFollowing(@RequestParam("userId") String userId,
         @RequestParam("friendId") String friendId) {
      try {
         Friend friend = new Friend();
         friend.setUserId(userId);
         friend.setFriendId(friendId);
         // 차단 상태 설정은 서비스 레이어 또는 매퍼에서 수행할 수 있습니다.
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

   // 팔로잉 수
   /*
    * @GetMapping("countFollowing.do")
    * 
    * @ResponseBody public int countFollowing(@RequestParam("userId") String
    * userId) {
    * 
    * return friendService.countFollowing(userId); }
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

   // 팔로잉 중인 계정 검색

   @RequestMapping("searchFollowing.do")

   @ResponseBody
   public ResponseEntity<ArrayList<Friend>> searchFollowingMethod(HttpServletRequest request,

         @RequestParam("userId") String userId, @RequestParam("friendId") String friendId) {
      String requestContentType = request.getContentType();
      System.out.println("Request Content-Type: " + requestContentType);
      System.out.println("userId: " + userId + ", friendId: " + friendId);
      System.out.println("Accept Header: " + request.getHeader("Accept"));
      Friend friend = new Friend();
      friend.setUserId(userId);
      friend.setFriendId(friendId);

      ArrayList<Friend> searchResults = friendService.searchFollowing(friend);

      return ResponseEntity.ok(searchResults);
   }

   /*
    * // 팔로우 중인 계정 검색2
    * 
    * @RequestMapping("searchFollowing.do")
    * 
    * @ResponseBody public List<Friend> searchFollowingMethod(@RequestBody
    * searchFriend friend) { System.out.println("userId: " + friend.getUserId() +
    * ", friendId: " + friend.getFriendId());
    * 
    * List<Friend> searchResults = new List<Friend>();
    * 
    * List<Friend> searchResults = friendService.searchFollowing(friend);
    * 
    * return searchResults; }
    */

}
