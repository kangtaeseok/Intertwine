package org.edu.intertwine.post.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.bookmark.model.service.BookmarkService;
import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.edu.intertwine.comment.model.service.CommentService;
import org.edu.intertwine.comment.model.vo.Comment;
import org.edu.intertwine.common.FileNameChange;
import org.edu.intertwine.common.GPS;
import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.post.model.service.PostService;
import org.edu.intertwine.post.model.vo.FeedItem;
import org.edu.intertwine.post.model.vo.Gallery;
import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.SearchMyPage;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.drew.imaging.ImageProcessingException;

@Controller
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Autowired
	private PostService postService; // 다형성 이용 (동적바인딩)
	@Autowired
	private UserService userService;
	@Autowired
	private BookmarkService bookmarkService;
	@Autowired
	private FriendService friendService;
	@Autowired
	private CommentService commentService;

	//글쓰기 화면으로 이동
	@RequestMapping("create.do")
	public String moveCreate() {
		return "post/write";
	}
	
	//전화면으로 돌아가기
	@RequestMapping("back.do")
	public String moveBack(@RequestParam("postId")int postId, HttpSession session, Model model) {
		
		//로그인 유저
		User loginUser = (User) session.getAttribute("loginUser");
		//포스트 유저
		String postUserId = postService.selectFindUserId(postId);
		
		logger.info(postUserId);
		logger.info(loginUser.toString());
		if( postUserId.equals(loginUser.getUserId())) {
			//포스트만든 유저 아이디와 로그인 유저 아이디가 같을 시
			//나의 포스트 페이지로 이동
			return "redirect:mypage.do";
		} else {
			//포스트 만든 유저 아이디와 로그인 유저 아이디가 다를 시
			return "redirect:page.do?friendId=" + loginUser.getUserId();	
		}
			
	}
		
	//전화면으로 돌아가기2
	@RequestMapping("back2.do")
	public String moveBack(@RequestParam("userId")String userId, HttpSession session, Model model) {
		
		//로그인 유저
		User loginUser = (User) session.getAttribute("loginUser");
		
		logger.info(loginUser.toString());

		if( userId.equals(loginUser.getUserId())) {
			//포스트만든 유저 아이디와 로그인 유저 아이디가 같을 시
			//나의 포스트 페이지로 이동
			return "redirect:mypage.do";
		} else {
			//포스트 만든 유저 아이디와 로그인 유저 아이디가 다를 시
			return "redirect:page.do?friendId=" + userId;	
		}
			
	}
	
	//남의 페이지 검색
	@RequestMapping(value="searchothermypage.do", method = { RequestMethod.POST, RequestMethod.GET } )
	public ModelAndView searchOtherMyPage(HttpSession session, @RequestParam("friendId")String friendId, @RequestParam("keyword")String keyword, @RequestParam("condition")int condition, ModelAndView mv) throws UnsupportedEncodingException {
		
		User loginUser = (User) session.getAttribute("loginUser");
		
		Friend friend = new Friend(loginUser.getUserId(), friendId);
		String FollowingId = friendService.selectFollowingId(friend);
	    String FollowerId = friendService.selectFollowerId(friend);
	    
	    int isFollowing = 0;
	    isFollowing = friendService.selectFollowing(friend);
	    int isFollower = friendService.selectFollower(friend);
	    
	    
	    
		logger.info(friendId);
		logger.info(keyword);
		logger.info(String.valueOf(condition));
		String decodedKeyword = URLDecoder.decode(keyword, StandardCharsets.UTF_8.toString());
		SearchMyPage searchMyPage = new SearchMyPage(friendId, decodedKeyword);
		logger.info(decodedKeyword);
		
		ArrayList<Post> posts = new ArrayList<Post>();
		switch(condition) {

		case 0:
			//전체 검색

        	if(isFollowing == 1) {
        		
        		List<Post> postsByTag = postService.selectPostsBySearchTagFollower(searchMyPage);
        		List<Post> postsByKeyword = postService.selectPostsBySearchKeywordFollower(searchMyPage);
     	        Set<Post> combinedPosts = new HashSet<>(postsByTag);
    	        combinedPosts.addAll(postsByKeyword);
    	        posts = new ArrayList<>(combinedPosts);
        		 	 
        	} else {
        		
        		List<Post> postsByTag = postService.selectPostsBySearchTagNotFollower(searchMyPage);
       		 	List<Post> postsByKeyword = postService.selectPostsBySearchKeywordNotFollower(searchMyPage);
    	        Set<Post> combinedPosts = new HashSet<>(postsByTag);
    	        combinedPosts.addAll(postsByKeyword);
    	        posts = new ArrayList<>(combinedPosts);
    	        
        	}

			break;				

		case 1:
			//태그 검색
			
			if(isFollowing == 1) {
				
				posts = postService.selectPostsBySearchTagFollower(searchMyPage);
			}else {
				
				posts = postService.selectPostsBySearchTagNotFollower(searchMyPage);
			}
			break;
			
		case 2:
			//콘텐츠 검색
			
			if(isFollowing == 1) {
				
				posts = postService.selectPostsBySearchKeywordFollower(searchMyPage);
				
			}else {
				
				posts = postService.selectPostsBySearchKeywordNotFollower(searchMyPage);
			}
			break;
		}
		
		User user = userService.selectUser(friendId);
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		
		
		
		//정렬을 거쳐올 경우 정렬 값을 담음
		if(posts.size() > 0) {		
			for (Post post : posts) {
		        Gallery gallery = new Gallery();
		        gallery.setPost(post);
		        gallery.setLikeCount(postService.selectLikeCounts(post.getPostId())); 
		        gallery.setCommentCount(commentService.selectCommentCounts(post.getPostId()));
		        gallery.setVideo(postService.selectOneVideo(post.getPostId()));
		        gallery.setImage(postService.selectOneImage(post.getPostId()));
		        gallery.setTags(postService.selectTags(post.getPostId()));
		        logger.info(gallery.toString());
		        
		        galleries.add(gallery);
		        
		    }
		}
		
		int followingCount = friendService.countFollowing(friendId);
		int followerCount = friendService.countFollowers(friendId);
		
		if(posts.size() > 0 ) {
			mv.addObject("galleries", galleries);
		}
		mv.addObject("user", user);
		mv.addObject("followingCount", followingCount);
		mv.addObject("followerCount", followerCount);
		mv.setViewName("post/page.do?friendId=" + friendId );
		
		return mv;
		
		
	}
	
	//남의 마이페이지 들어갈 때
	@RequestMapping("page.do")
	public ModelAndView moveOthersMyPage(String friendId, HttpSession session, ModelAndView mv) {

		//남의 아이디를 받음
		User otherUser = userService.selectUser(friendId);
		//로그인 유저
		User loginUser = (User) session.getAttribute("loginUser");
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		ArrayList<Post> posts = new ArrayList<Post>();
		
		//팔로잉 여부 확인
		int followingCount = friendService.countFollowing(friendId);
		int followerCount = friendService.countFollowers(friendId);
		Friend friend = new Friend(loginUser.getUserId(), otherUser.getUserId());
		String FollowingId = friendService.selectFollowingId(friend);
	    String FollowerId = friendService.selectFollowerId(friend);
	    
	    int isFollowing = 0;
	    isFollowing = friendService.selectFollowing(friend);
	    int isFollower = friendService.selectFollower(friend);
	    
		//정렬을 거쳐올 경우 정렬 값을 담음
	    Integer value = (Integer) session.getAttribute("sortPreference");
	    if (value == null) {
	        value = 0; // 기본 정렬방식
	    }
	    
	    switch(value) {
	        case 0:
	        	if(isFollowing == 1) {
	        		posts = postService.selectPostsByIdFollower(friendId);
	        	} else {
	        		posts = postService.selectPostsByIdNotFollower(friendId);
	        	}
	            
	            break;
	            
	        case 1:
	        	
	        	if(isFollowing == 1) {
	        		posts = postService.selectPostsByIdOldestToNewestFollower(friendId);
	        	} else {
	        		posts = postService.selectPostsByIdOldestToNewestNotFollower(friendId);
	        	}
	            break;
	            
	        case 2:
	        	
	        	if(isFollowing == 1) {
	        		posts = postService.selectPostsByIdMostViewsToLeastFollower(friendId);
	        	} else {
	        		posts = postService.selectPostsByIdMostViewsToLeastNotFollower(friendId);
	        	}
	            break;
	            
	        default:
	        	
	            posts = postService.selectPostsById(friendId);
	            break;
	    }
	    
		//그 포스트를 담음
		for (Post post : posts) {
	        Gallery gallery = new Gallery();
	        gallery.setPost(post);
	        gallery.setLikeCount(postService.selectLikeCounts(post.getPostId())); 
	        gallery.setCommentCount(commentService.selectCommentCounts(post.getPostId()));
	        gallery.setVideo(postService.selectOneVideo(post.getPostId()));
	        gallery.setImage(postService.selectOneImage(post.getPostId()));
	        gallery.setTags(postService.selectTags(post.getPostId()));
	        logger.info(gallery.toString());
	        
	        galleries.add(gallery);
	        
	    }
		//팔로잉 팔로워 횟수 셈

	    
	    mv.addObject("isFollowing", isFollowing);
	    mv.addObject("FollowingId", FollowingId);
	    mv.addObject("FollowerId", FollowerId);
		mv.addObject("galleries", galleries);
		mv.addObject("otheruser", otherUser);
		mv.addObject("user", loginUser);
		mv.addObject("followingCount", followingCount);
		mv.addObject("followerCount", followerCount);
		mv.addObject("sortPreference", value);
		session.removeAttribute("sortPreference");
		mv.setViewName("post/othermypage");
		
		return mv;
	}
	
	//배치액션
	@RequestMapping(value="batchAction.do", method=RequestMethod.POST)
	public String batchActions(@RequestParam("action")String action, @RequestParam("checks") List<String> postIds, Model model) {
		
		logger.info("postIds" + postIds.toString());
		
		if (postIds.size() > 0) {
			switch (action) {
			case "delete":
				postService.deleteBatchDelete(postIds);
				break;
			case "public":
				postService.updateBatchPublic(postIds);
				break;
			case "friend":
				postService.updateBatchFollowing(postIds);
				break;
			case "private":
				postService.updateBatchPrivate(postIds);	
				break;
			case "pinon":
				postService.updateBatchPinOn(postIds);
				break;
			case "pinoff":
				postService.updateBatchPinOff(postIds);
				break;

			}
		}
		return "redirect:mypage.do";
	}
		
	//정렬을 위한 메소드
	@RequestMapping(value = "sorting1.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String sortingPage1 (HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelAndView mv, @RequestParam("dropdown")int value) {
		
		logger.info(String.valueOf(value));
		session.setAttribute("sortPreference", value);
		return "redirect:mypage.do";
	}
	
	//정렬을 위한 메소드
	@RequestMapping(value = "sorting2.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String sortingPage2 (HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelAndView mv, @RequestParam("dropdown")int value, @RequestParam("otherUserId")String friendId) {
		
		logger.info(String.valueOf(value));
		session.setAttribute("sortPreference", value);
		
		return "redirect:page.do?friendId=" + friendId;
	}
	
	//내가 나의 페이지 들어갈 때
	@RequestMapping(value = "mypage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView moveMyPage(HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelAndView mv) {
		
		User user = (User) session.getAttribute("loginUser");
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		
		ArrayList<Post> posts = new ArrayList<Post>();
		
		//정렬을 거쳐올 경우 정렬 값을 담음
	    Integer value = (Integer) session.getAttribute("sortPreference");
	    if (value == null) {
	        value = 0; // 기본 정렬방식
	    }
	    
	    switch(value) {
	        case 0:
	            posts = postService.selectPostsById(user.getUserId());
	            break;
	        case 1:
	            posts = postService.selectPostsByIdOldestToNewest(user.getUserId());
	            break;
	        case 2:
	            posts = postService.selectPostsByIdMostViewsToLeast(user.getUserId());
	            break;
	        default:
	            posts = postService.selectPostsById(user.getUserId());
	            break;
	    }
				
		for (Post post : posts) {
	        Gallery gallery = new Gallery();
	        gallery.setPost(post);
	        gallery.setLikeCount(postService.selectLikeCounts(post.getPostId())); 
	        gallery.setCommentCount(commentService.selectCommentCounts(post.getPostId()));
	        gallery.setVideo(postService.selectOneVideo(post.getPostId()));
	        gallery.setImage(postService.selectOneImage(post.getPostId()));
	        gallery.setTags(postService.selectTags(post.getPostId()));
	        logger.info(gallery.toString());
	        
	        galleries.add(gallery);
	        
	    }
		
		int followingCount = friendService.countFollowing(user.getUserId());
		int followerCount = friendService.countFollowers(user.getUserId());
		
		mv.addObject("galleries", galleries);
		mv.addObject("user", user);
		mv.addObject("followingCount", followingCount);
		mv.addObject("followerCount", followerCount);
		mv.setViewName("post/mypage");
		mv.addObject("sortPreference", value);
		session.removeAttribute("sortPreference");
		
		return mv;
	}
		
	//공감업데이트
	@RequestMapping(value="updatereaction.do", method = { RequestMethod.POST, RequestMethod.GET } )
	@ResponseBody
	public String updateLike(@RequestParam("userId")String userId, @RequestParam("postId")int postId, @RequestParam("likeType")int likeType, Model model) {
		//공감을 업데이트
		//가져온 값을 담음
		System.out.println("User ID: " + userId);
	    System.out.println("Post ID: " + postId);
	    System.out.println("Like Type: " + likeType);
	    String likeType2 = String.valueOf(likeType);
	    
		Like like1 = new Like(userId, postId);
		Like like2 = new Like(userId, postId, likeType2);
		logger.info("가져온 공감타입" + likeType2);
		//먼저 이 포스트에 이 사람이 전에 무슨 공감을 했는 지 확인
		String whatIsLiked = postService.selectWhatIsLiked(like1);
		
		//이전에 이 포스트에 공감을 한 적이 있는 경우
		if(whatIsLiked != null) {
			
			if(whatIsLiked.equals(likeType2)) {
				//DB에서 가져온 공감타입이 뷰에서 가져온 공감타입과 같은 경우
				//공감 삭제 delete
				int result = postService.deleteLikeType(like1);
				
			}else {
				//DB에서 가져온 공감타입이 뷰에서 가져온 공감타입과 다른 경우
				//공감 변경 update
				int result = postService.updateLikeType(like2);
			}
			
			
		}else {
			//이전에 이 포스트에 공감을 한적이 없는 경우
			//공감 삽입 insert
			int result = postService.insertLikeType(like2);
		}
		
		
		return "redirect:detail.do?postId=" + postId;
		
		
		
	}
	
	
	//공감업데이트2
	@RequestMapping(value="updatereaction2.do", method = { RequestMethod.POST, RequestMethod.GET } )
	@ResponseBody
	public String updateLike2(@RequestParam("userId")String userId, @RequestParam("postId")int postId, @RequestParam("likeType")String likeType, Model model) {
		//공감을 업데이트
		//가져온 값을 담음
		Like like1 = new Like(userId, postId);
		Like like2 = new Like(userId, postId, likeType);
		logger.info("가져온 공감타입" + likeType);
		//먼저 이 포스트에 이 사람이 전에 무슨 공감을 했는 지 확인
		String whatIsLiked = postService.selectWhatIsLiked(like1);
		
		//이전에 이 포스트에 공감을 한 적이 있는 경우
		if(whatIsLiked != null) {
			
			if(whatIsLiked.equals(likeType)) {
				//DB에서 가져온 공감타입이 뷰에서 가져온 공감타입과 같은 경우
				//공감 삭제 delete
				int result = postService.deleteLikeType(like1);
				
			}else {
				//DB에서 가져온 공감타입이 뷰에서 가져온 공감타입과 다른 경우
				//공감 변경 update
				int result = postService.updateLikeType(like2);
			}
			
			
		}else {
			//이전에 이 포스트에 공감을 한적이 없는 경우
			//공감 삽입 insert
			int result = postService.insertLikeType(like2);
		}
		
		
		return "redirect:getfeed.do";
		
		
		
	}

	//포스트 생성
	@RequestMapping(value = "posting.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView createPost(HttpSession session, HttpServletRequest request, HttpServletResponse response, Post post,
			@RequestParam(name = "files", required = false) List<MultipartFile> files,
			@RequestParam(name = "tagName", required = false) String[] tags, ModelAndView mv)
			throws IllegalStateException, IOException, ImageProcessingException {

		logger.info("files : " + files.toString());
		logger.info("userId : " + post.getUserId());
		User user = (User) session.getAttribute("loginUser");
		logger.info(user.toString());
		post.setUserId(user.getUserId());
		logger.info("PostContent : " + post.getPostContent());
		logger.info("PostVisible : " + post.getPostVisible());
		
		logger.info(post.getUserId());
		// 세션에서 들고온 userid post객체에 저장
		// 포스트 저장 우선 그다음 포스트 아이디 필요
		postService.insertPost(post);
		// 가장 최신의 포스트 아이디 찾아옴 거기서 postId 가져옴
		Post p = postService.selectLatestPostId();
		logger.info(p.toString());

		// 태그가 널이 아니라면
		if (tags != null && tags.length > 0) {

		    for (String tag : tags) {
		    	logger.info(tag);
		        Tag newTag = new Tag(p.getPostId(), tag);
		        postService.insertTag(newTag);
		    }
		}
		// 사진 저장 및 동영상 저장 필요
		if (files != null && files.size() > 0) {
			for (MultipartFile mf : files) {
				String uniqueSuffix = UUID.randomUUID().toString();
				// 업로드된 파일이 사진인지 동영상인지 확장자로 판별
				String originalFileName = mf.getOriginalFilename();
				logger.info("파일 이름: " + mf.getOriginalFilename());
				String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1).toLowerCase();

				if ("jpg".equals(fileExtension) || "png".equals(fileExtension) || "gif".equals(fileExtension)) {
					String renameFileName = null;
					if (originalFileName != null && originalFileName.length() > 0) {
						renameFileName = FileNameChange.change(originalFileName, "yyyyMMddHHmmss");
						logger.info("첨부파일명 변경 확인: " + originalFileName + ", " + uniqueSuffix + renameFileName);
						// 지정한 저장 폴더에 파일명 변경 처리
						String savePath = request.getSession().getServletContext().getRealPath("resources/postimage");
						logger.info("저장위치 확인: " + savePath);
						mf.transferTo(new File(savePath + "\\" + uniqueSuffix +renameFileName));

						GPS gps = new GPS(); // 이거 확정아님
						double[] gpsdata = gps.getGPS(savePath + "\\" + uniqueSuffix +renameFileName);

						if (gpsdata == null) {
							// 위도 경도 없을 시
							Image image = new Image(p.getPostId(), "resources/postimage" + "\\" + uniqueSuffix +renameFileName);
							postService.insertImage2(image);

						} else { // 위도 경도 있을 시
							double lon = gpsdata[0];
							double lat = gpsdata[1];
							Image image = new Image(p.getPostId(), lon, lat, "resources/postimage" + "\\" + uniqueSuffix + renameFileName);
							postService.insertImage1(image);

						}

					} // if
				} // 사진확장자

				if ("mp4".equals(fileExtension)) {
					String renameFileName2 = null;
					if (originalFileName != null && originalFileName.length() > 0) {
						renameFileName2 = FileNameChange.change(originalFileName, "yyyyMMddHHmmss");
						logger.info("첨부파일명 변경 확인: " + originalFileName + ", " + uniqueSuffix + renameFileName2 );
						// 지정한 저장 폴더에 파일명 변경 처리
						String savePath = request.getSession().getServletContext().getRealPath("resources/postvideo");
						logger.info(savePath);
						mf.transferTo(new File(savePath + "\\" + uniqueSuffix +renameFileName2 ));
						Video video = new Video(p.getPostId(), "resources/postimage" + "\\" + uniqueSuffix + renameFileName2);
						postService.insertVideo(video);

					} // if

				} // 동영상확장자
				
			} // 파일foreach문
			
		} // 파일이 있다면

		mv.addObject("포스트가 생성되었습니다.");
		mv.setViewName("common/main");

		return mv;

	}// 메소드

	//피드
	@RequestMapping(value = "getfeed.do", method = {RequestMethod.GET })
	public ModelAndView getFeed(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelAndView mv) {
		
		
		User loginUser = (User) session.getAttribute("loginUser");
		logger.info("loginUser:" + loginUser);
		
		// 일단 자신을 제외한 모든 유저아이디를 받아옴
		ArrayList<String> userIds = postService.selectUserIds(loginUser.getUserId());
		
		

		ArrayList<Integer> postIds = new ArrayList<Integer>();
		// 만약 사이즈가 0이면 다른 쿼리문 작동
		if (userIds.size() > 0) {
			// 그걸로 포스트 아이디들을 쭉 받아옴
			logger.info(userIds.toString());
			//어카운트 상태가 활성화되어있으며 정지유저가 아니고 포스트가 공개상태인 포스트 아이디만 받아옴
			postIds = postService.selectPostIds(userIds);
			logger.info(postIds.toString());

		} else {

			postIds = postService.selectPostIdsforZero();
		}
		
		logger.info("postIds: " + postIds.size());
		logger.info("postIds: " + postIds.toString());
		// 피드 아이템 선언 이것들이 사용될 예정

		// 다음 받아온 아이디로 모든걸 가져옴

		// 포스트 아이디 갯수 셈
		if (postIds.size() > 0) {
		  	//피드 변수들 여러개 담을거 선언
			ArrayList<FeedItem> feedItems = new ArrayList<FeedItem>();
			//프로필 사진이 없는 경우 이것을 사용
			String defaultImage = request.getSession().getServletContext().getRealPath("resources/profile/images.jpg");
			
			for (int i = 0; i < postIds.size(); i++) {
				
				//리스트로 유저아이디 하나씩 꺼냄
				
				String eachPostId = String.valueOf(postIds.get(i));
				int each = Integer.parseInt(eachPostId);
				 //포스트 아이디로 유저 아이디 찾아옴
				
				String findUserId = postService.selectFindUserId(each);
	       
				//  Mypage mypage = userService.(무언가)
				// 유저정보 담음
				User user = userService.selectUser(findUserId);
				// 포스트 정보 담음
				Post post = postService.selectOnePost(Integer.parseInt(eachPostId));
				// 이미지 정보 담음
				Image image = postService.selectOneImage(Integer.parseInt(eachPostId));
				// 동영상 정보 담음
				Video video = postService.selectOneVideo(Integer.parseInt(eachPostId));
				
				// 좋아요 수 정보 담음
				int likeCount = postService.selectLikeCounts(Integer.parseInt(eachPostId));

				Friend friend = new Friend(loginUser.getUserId(), findUserId);
				int isFollowing = friendService.selectFollowing(friend);
				logger.info(String.valueOf(isFollowing));
				int isFollowed = friendService.selectFollower(friend);
				// 1이면 팔로우중 -> 언팔로우 버튼 / 0이면 팔로우중 아님 -> 팔로우 버튼

				Like like = new Like(loginUser.getUserId(), Integer.parseInt(eachPostId));
				int isLiked = postService.selectIsLiked(like);
				// 1이면 이미 공감중 0이면 공감안하고 있음
				
				String whatIsLiked = null;
				
				if(isLiked == 1) {
					whatIsLiked = postService.selectWhatIsLiked(like);
				} else {
					whatIsLiked = null;
				}

				Bookmark bookmark = new Bookmark(loginUser.getUserId(), Integer.parseInt(eachPostId));
				int isBookmarked = bookmarkService.selectIsBookmarked(bookmark);
				// 1이면 이미 북마크함 북마크 검정버튼 0이면 북마크 안함 북마크 하얀버튼
				
				FeedItem feedItem = new FeedItem(user, post, image, video, likeCount, isLiked, whatIsLiked, isBookmarked, isFollowing, isFollowed);
				feedItems.add(feedItem);
				
			}
			
			mv.addObject("feedItems", feedItems);
			mv.addObject("defaultImage", defaultImage);
			mv.setViewName("post/feed");
			logger.info(mv.toString());
			return mv;

		} else {
			mv.addObject("message", "보여줄 피드가 없습니다.");
			mv.setViewName("common/main");
			return mv;

		} // else

	}
	
	@RequestMapping(value = "getbookmarkfeed.do", method = {RequestMethod.GET })
	public ModelAndView getBookmarkFeed(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelAndView mv) {
		
		
		User loginUser = (User) session.getAttribute("loginUser");
		logger.info("loginUser:" + loginUser);
		
		// 내가 북마크한 포스트 아이디들을 받아옴

		ArrayList<Integer> postIds = new ArrayList<Integer>();
		// 만약 사이즈가 0이면 다른 쿼리문 작동
		
		// 그걸로 포스트 아이디들을 쭉 받아옴
			
		postIds = postService.selectBookmarkedPosts(loginUser.getUserId());
		
		logger.info("postIds: " + postIds.size());
		logger.info("postIds: " + postIds.toString());
		// 피드 아이템 선언 이것들이 사용될 예정

		// 다음 받아온 아이디로 모든걸 가져옴

		// 포스트 아이디 갯수 셈
		if (postIds.size() > 0) {
		  	//피드 변수들 여러개 담을거 선언
			ArrayList<FeedItem> feedItems = new ArrayList<FeedItem>();
			//프로필 사진이 없는 경우 이것을 사용
			String defaultImage = request.getSession().getServletContext().getRealPath("resources/profile/images.jpg");
			
			for (int i = 0; i < postIds.size(); i++) {
				
				//리스트로 유저아이디 하나씩 꺼냄
				
				String eachPostId = String.valueOf(postIds.get(i));
				int each = Integer.parseInt(eachPostId);
				 //포스트 아이디로 유저 아이디 찾아옴
				
				String findUserId = postService.selectFindUserId(each);
	       
				//  Mypage mypage = userService.(무언가)
				// 유저정보 담음
				User user = userService.selectUser(findUserId);
				// 포스트 정보 담음
				Post post = postService.selectOnePost(Integer.parseInt(eachPostId));
				// 이미지 정보 담음
				Image image = postService.selectOneImage(Integer.parseInt(eachPostId));
				// 동영상 정보 담음
				Video video = postService.selectOneVideo(Integer.parseInt(eachPostId));
				
				// 좋아요 수 정보 담음
				int likeCount = postService.selectLikeCounts(Integer.parseInt(eachPostId));

				Friend friend = new Friend(loginUser.getUserId(), findUserId);
				int isFollowing = friendService.selectFollowing(friend);
				logger.info(String.valueOf(isFollowing));
				int isFollowed = friendService.selectFollower(friend);
				// 1이면 팔로우중 -> 언팔로우 버튼 / 0이면 팔로우중 아님 -> 팔로우 버튼

				Like like = new Like(loginUser.getUserId(), Integer.parseInt(eachPostId));
				int isLiked = postService.selectIsLiked(like);
				// 1이면 이미 공감중 0이면 공감안하고 있음
				
				String whatIsLiked = null;
				
				if(isLiked == 1) {
					whatIsLiked = postService.selectWhatIsLiked(like);
				} else {
					whatIsLiked = null;
				}

				Bookmark bookmark = new Bookmark(loginUser.getUserId(), Integer.parseInt(eachPostId));
				int isBookmarked = bookmarkService.selectIsBookmarked(bookmark);
				// 1이면 이미 북마크함 북마크 검정버튼 0이면 북마크 안함 북마크 하얀버튼
				
				FeedItem feedItem = new FeedItem(user, post, image, video, likeCount, isLiked, whatIsLiked, isBookmarked, isFollowing, isFollowed);
				feedItems.add(feedItem);
				
			}
			
			mv.addObject("feedItems", feedItems);
			mv.addObject("defaultImage", defaultImage);
			mv.setViewName("post/bookmarkfeed");
			logger.info(mv.toString());
			return mv;

		} else {
			mv.addObject("message", "보여줄 피드가 없습니다.");
			mv.setViewName("common/main");
			return mv;

		} // else

	}

	//디테일 뷰 확인
	@RequestMapping(value = "detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView showDetailView(@RequestParam("postId")int postId, ModelAndView mv, HttpSession session) {
	    
		//포스트 아이디로 연결된 사진들 가져옴
		ArrayList<Image> images = postService.selectImagesByPostId(postId);
		logger.info("images" + images.toString());
		//비디오도 있다면 가져옴
		Video video = postService.selectOneVideo(postId);
		//logger.info("video" + video.toString());
		//String postUserId = postService.selectUserId(postId);
		//logger.info("postUserId" + postUserId.toString());
		//User postUser = userService.selectUser(postUserId);
		//logger.info("postUser" + postUser.toString());
		
		//현재 로그인 중인 유저정보 가져옴
		User viewingUser = (User) session.getAttribute("loginUser");
		//logger.info("viewingUser" + viewingUser.toString());
		//포스트 아이디로 포스트 정보를 가져옴(포스트 게시글, 핀여부 등등)
		Post post = postService.selectOnePost(postId);
		
		//포스트 조회수 1 늘림(본인이 보는 것이 아닐때만 반달방지)
		if(!viewingUser.getUserId().equals(post.getUserId())) {
			postService.updatePostViews(post);
		}
		//logger.info("post" + post.toString());
		//포스트에 있는 태그들 가져옴
		ArrayList<Tag> tags = postService.selectTags(postId);
		//logger.info("tags" + tags.toString());
		//포스트에 있는 댓글들 가져옴
		ArrayList<Comment> comments = commentService.selectComments(postId);
		//logger.info("comments" + comments.toString());
		// 총 공감 갯수 세서 가져옴
		int likeCount = postService.selectLikeCounts(postId);
		//logger.info("likeCount" + likeCount);
		//현재 세션 접속중인 유저아이디와 포스트를 작성한 사람의 유저 아이디를 담아
		Friend friend = new Friend(viewingUser.getUserId(), post.getUserId());
		//팔로잉 여부 확인
		int isFollowing = friendService.selectFollowing(friend);
		Like like = new Like(viewingUser.getUserId(), post.getPostId());
		//이 포스트에 공감을 했는 지 여부 확인
		int isLiked = postService.selectIsLiked(like);
		//무슨 버튼이 클릭되었는지 확인(한번도 상호작용을 한 적이 없을 시 null일 수 있음)
		String result= postService.selectWhatIsLiked(like);
		String whatIsLiked = null;
		if ( result != null) {
			whatIsLiked = postService.selectWhatIsLiked(like);
		}
		Bookmark bookmark = new Bookmark(viewingUser.getUserId(), post.getPostId());
		//이 포스트를 북마크 했는 지 여부 확인
		int isBookmarked = bookmarkService.selectIsBookmarked(bookmark);
		//포스트 작성자가 이 포스트를 핀 했는 지 여부 확인
		Post pincheck = new Post(postId, post.getUserId());
		int isPinned = postService.selectIsPinned(pincheck);
		
		//모두 담아 보냄
	    mv.addObject("images", images);
	    mv.addObject("video", video);
	    mv.addObject("viewingUser", viewingUser);
	    mv.addObject("post", post);
	    mv.addObject("tags", tags);
		mv.addObject("comments", comments);
	    mv.addObject("likeCount", likeCount);
	    mv.addObject("isFollowing", isFollowing);
	    mv.addObject("isLiked", isLiked);
		mv.addObject("whatIsLiked", whatIsLiked);
	    mv.addObject("isBookmarked", isBookmarked);
	    mv.addObject("isPinned", isPinned);
		mv.setViewName("post/detailview");
		
	    return mv;
	}
	
	//포스트 삭제
	@RequestMapping(value="deletepost.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deletePost(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		int p = Integer.parseInt(postId);
		logger.info(String.valueOf(p));
		
		Post post = new Post (p, userId);
		postService.deletePost(post);
		
		return "redirect:mypage.do"; 
	}
	
	//핀 업데이트
	@RequestMapping(value="updatepin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String updatePin(@RequestParam("value")String value, @RequestParam("postId")String postId, @RequestParam("userId")String userId, Model model) {
		
		int p = Integer.parseInt(postId);
	
		Post post = new Post(p, userId);
		
		switch(value) {
		case "0":
			//핀이 안되있을 경우
			postService.updatePin1(post);
			break;
			
		case "1":
			//핀이 되어있을 경우
			postService.updatePin2(post);
			break;
		}
		
		return "redirect:detail.do?postId=" + postId; 
		
		
	}
	
	
	@RequestMapping(value="searchmypage.do", method = { RequestMethod.POST, RequestMethod.GET } )
	public ModelAndView searchMyPage(@RequestParam("userId")String userId, @RequestParam("keyword")String keyword, @RequestParam("condition")int condition, ModelAndView mv) throws UnsupportedEncodingException {
		
		
		logger.info(userId);
		logger.info(keyword);
		logger.info(String.valueOf(condition));
		String decodedKeyword = URLDecoder.decode(keyword, StandardCharsets.UTF_8.toString());
		SearchMyPage searchMyPage = new SearchMyPage(userId, decodedKeyword);
		logger.info(decodedKeyword);
		
		ArrayList<Post> posts = new ArrayList<Post>();
		switch(condition) {

		case 0:
			//전체 검색
			List<Post> postsByTag = postService.selectPostsBySearchTag(searchMyPage);
	        List<Post> postsByKeyword = postService.selectPostsBySearchKeyword(searchMyPage);
	        Set<Post> combinedPosts = new HashSet<>(postsByTag);
	        combinedPosts.addAll(postsByKeyword);
	        posts = new ArrayList<>(combinedPosts);
	        
			break;				

		case 1:
			//태그 검색
			posts = postService.selectPostsBySearchTag(searchMyPage);
			break;
			
		case 2:
			//콘텐츠 검색
			posts = postService.selectPostsBySearchKeyword(searchMyPage);
			break;
		}
		
		User user = userService.selectUser(userId);
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		
		
		
		//정렬을 거쳐올 경우 정렬 값을 담음
		if(posts.size() > 0) {		
			for (Post post : posts) {
		        Gallery gallery = new Gallery();
		        gallery.setPost(post);
		        gallery.setLikeCount(postService.selectLikeCounts(post.getPostId())); 
		        gallery.setCommentCount(commentService.selectCommentCounts(post.getPostId()));
		        gallery.setVideo(postService.selectOneVideo(post.getPostId()));
		        gallery.setImage(postService.selectOneImage(post.getPostId()));
		        gallery.setTags(postService.selectTags(post.getPostId()));
		        logger.info(gallery.toString());
		        
		        galleries.add(gallery);
		        
		    }
		}
		
		int followingCount = friendService.countFollowing(userId);
		int followerCount = friendService.countFollowers(userId);
		
		if(posts.size() > 0 ) {
			mv.addObject("galleries", galleries);
		}
		mv.addObject("user", user);
		mv.addObject("followingCount", followingCount);
		mv.addObject("followerCount", followerCount);
		mv.setViewName("post/mypage");
		
		return mv;
		
		
	}
	
	

}// 클래스
