
package org.edu.intertwine.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.friend.model.vo.friendProfile;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.MyPage;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.net.aso.f;

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
		logger.info("loginUser:" + friendService.selectFollowingList(loginUser.getUserId()));
		logger.info("ㅇㅇ:" + loginUser);
		ArrayList<Friend> followinglist = friendService.selectFollowingList(loginUser.getUserId());
		ArrayList<Friend> followerlist = friendService.selectFollowerList(loginUser.getUserId());
		
		
		ArrayList<friendProfile> fProfile = new ArrayList<friendProfile>();
		ArrayList<friendProfile> fProfileFollowers = new ArrayList<>();

		for(Friend f : followinglist) {
			MyPage mypage = userService.selectMyPage(f.getFriendId());
			friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
			fProfile.add(fprofile);
		}
		
		for (Friend f : followerlist) {
	        MyPage mypage = userService.selectMyPage(f.getUserId());
	        friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
	        fProfileFollowers.add(fprofile);
	    }
		
//		model.addAttribute("followingList", followinglist);
		
//		model.addAttribute("followerList", followerlist);
		model.addAttribute("fProfile", fProfile);
		model.addAttribute("fProfileFollowers", fProfileFollowers);
//		ArrayList<User> friendProfile = userService.selectMyFriendPage(loginUser.getUserId());
//		model.addAttribute("friendProfile", friendProfile);
		if (followinglist == null) {
			followinglist = new ArrayList<>();
		}
		if (followerlist == null) {
			followinglist = new ArrayList<>();
		}
//		if (friendProfile == null) {
//			friendProfile = new ArrayList<>();
//		}
		return "friend/friendMainView";
	}
	
	//팔로우 메소드
//	@PostMapping("insertF.do")
	@RequestMapping(value = "insertF.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addFollowing(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId,
			HttpSession session) {
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setFriendId(friendId);
		System.out.println("userId:" + userId + "friendId : " + friendId);
		logger.info("userId:" + userId + "friendId : " + friendId);
		try {
			int response = friendService.insertFollowing(friend);
			if (response > 0) {
				session.setAttribute("followMessage", "팔로우 성공!");
			} else {
				session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
			}
		} catch (Exception e) {
			session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
		}
		return "redirect:friendPage.do";
	}
	
	//팔로우 메소드 detailView 로 리다이렉트하는 메소드
//	@PostMapping("insertF.do")
	@RequestMapping(value = "insertmypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addFollowingA(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId,
			HttpSession session) {
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setFriendId(friendId);
		System.out.println("userId:" + userId + "friendId : " + friendId);
		logger.info("userId:" + userId + "friendId : " + friendId);
		try {
			int response = friendService.insertFollowing(friend);
			if (response > 0) {
				session.setAttribute("followMessage", "팔로우 성공!");
			} else {
				session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
			}
		} catch (Exception e) {
			session.setAttribute("followMessage", "팔로우 실패. 이미 팔로우 중이거나 오류가 발생했습니다.");
		}
		return "redirect:page.do?friendId=" + friendId;
	}
	
	
	
	

	// 팔로잉 취소 메소드
	@PostMapping("unfollowing.do")
	public String unfollowing(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId,
			HttpSession session) {
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setFriendId(friendId);
		System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
		
		logger.info("userId:" + userId + "friendId : " + friendId + "ㅇ");
		try {
			int response = friendService.deleteFollowing(friend);
			if (response > 0) {
				session.setAttribute("dfollowMessage", "팔로우 취소!");
			} else {
				session.setAttribute("dfollowMessage", "이미 팔로우 취소 했거나 오류 발생");
			}
		} catch (Exception e) {
			logger.error("팔로우 취소 처리 중 오류 발생", e);
			session.setAttribute("dfollowMessage", "서버 오류로 인해 팔로우취소 처리를 완료하지 못했습니다.");
		}

		return "redirect:friendPage.do";
	}
	
	// 팔로잉 취소 메소드 detailView 로 리다이렉트하는 메소드
		@RequestMapping(value = "unfollowingMyPage.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String unfollowingA(@RequestParam("userId") String userId, @RequestParam("friendId") String friendId,
				HttpSession session) {
			Friend friend = new Friend();
			friend.setUserId(userId);
			friend.setFriendId(friendId);
			System.out.println("userId : " + friend.getUserId() + "friendId : " + friend.getFriendId());
			
			logger.info("userId:" + userId + "friendId : " + friendId + "ㅇ");
			try {
				int response = friendService.deleteFollowing(friend);
				if (response > 0) {
					session.setAttribute("dfollowMessage", "팔로우 취소!");
				} else {
					session.setAttribute("dfollowMessage", "이미 팔로우 취소 했거나 오류 발생");
				}
			} catch (Exception e) {
				logger.error("팔로우 취소 처리 중 오류 발생", e);
				session.setAttribute("dfollowMessage", "서버 오류로 인해 팔로우취소 처리를 완료하지 못했습니다.");
			}

			return "redirect:page.do?friendId=" + friendId;
		}

	

	//팔로잉 수 카운트
	@GetMapping("countFollowing.do")
	@ResponseBody
	public String countFollowing(@RequestParam("userId") String userId) {
		int followeringCount = friendService.selectCountFollowing(userId);
		return String.valueOf(followeringCount);
	}

	// 팔로워 수 카운트
	@GetMapping("countFollowers.do")
	@ResponseBody
	public String countFollowers(@RequestParam("userId") String userId) {
		int followersCount = friendService.selectCountFollowers(userId);
		return String.valueOf(followersCount);
	}

	// 차단 수 카운트
//
//	@GetMapping("countBlock.do")
//	@ResponseBody
//	public String countBlock(@RequestParam("userId") String userId) {
//		int blockedCount = friendService.countBlocks(userId);
//		return String.valueOf(blockedCount);
//	}

	// 팔로잉 중인 계정 검색(완)
	@RequestMapping("searchFollowing.do")
	public String searchFollowingMethod(Model model, HttpSession session, @RequestParam("keyword") String keyword) {
		User loginUser = (User) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		logger.info("loginUser:" + loginUser);
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setKeyword(keyword);
		ArrayList<Friend> searchF = friendService.selectSearchFollowing(friend);
		ArrayList<friendProfile> fProfile = new ArrayList<friendProfile>();
		for(Friend f : searchF) {
			MyPage mypage = userService.selectMyPage(f.getFriendId());
			friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
			fProfile.add(fprofile);
		}
		model.addAttribute("searchfProfile", fProfile);
		if (searchF != null) {
			return "friend/friendMainView";
		} else {
			return "redirect:friendPage.do";
		}
	}
	
	/*ArrayList<Friend> followinglist = friendService.selectFollowingList(loginUser.getUserId());
		ArrayList<Friend> followerlist = friendService.selectFollowerList(loginUser.getUserId());
		
		
		ArrayList<friendProfile> fProfile = new ArrayList<friendProfile>();
		ArrayList<friendProfile> fProfileFollowers = new ArrayList<>();

		for(Friend f : followinglist) {
			MyPage mypage = userService.selectMyPage(f.getFriendId());
			friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
			fProfile.add(fprofile);
		}
		
		for (Friend f : followerlist) {
	        MyPage mypage = userService.selectMyPage(f.getUserId());
	        friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
	        fProfileFollowers.add(fprofile);
	    }*/

	// 팔로워 계정 검색 (완)
	@RequestMapping("searchFollower.do")
	public String searchFollowerMethod(Model model, HttpSession session, @RequestParam("keyword") String keyword) {
		User loginUser = (User) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		logger.info("loginUser:" + loginUser);
		Friend friend = new Friend();
		friend.setUserId(userId);
		friend.setKeyword(keyword);
		ArrayList<Friend> searchFwer = friendService.selectSearchFollower(friend);
		ArrayList<friendProfile> fProfile = new ArrayList<friendProfile>();
		for(Friend f : searchFwer) {
			MyPage mypage = userService.selectMyPage(f.getUserId());
			friendProfile fprofile = new friendProfile(f.getUserId(), f.getFriendId(), f.getStatus(), mypage.getProfileDraft());
			fProfile.add(fprofile);
		}
		model.addAttribute("searchfProfile2", fProfile);
		model.addAttribute("searchFwer", searchFwer);

		return "friend/friendMainView";
	}

}
