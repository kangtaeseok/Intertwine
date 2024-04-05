package org.edu.intertwine.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping("create.do")
	public String moveCreate() {
		return "post/write";
	}
	
	
	@RequestMapping("page.do")
	public ModelAndView moveOthersMyPage(String friendId, HttpSession session, ModelAndView mv) {

		//남의 아이디를 받음
		User otherUser = userService.selectUser(friendId);
		//로그인 유저
		User loginUser = (User) session.getAttribute("loginUser");
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		//그걸로 포스트 받아옴
		
			ArrayList<Post> posts = postService.selectPostsById(friendId);
		
	
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
		int followingCount = friendService.countFollowing(friendId);
		int followerCount = friendService.countFollowers(friendId);
		Friend friend = new Friend(loginUser.getUserId(), otherUser.getUserId());
		String FollowingId = friendService.selectFollowingId(friend);
	    String FollowerId = friendService.selectFollowerId(friend);
	    int isFollowing = friendService.selectFollowing(friend);
	    int isFollower = friendService.selectFollower(friend);
	    if(isFollowing > 0) {
	         mv.addObject("isFollowing", isFollowing);
	      }
	      if(isFollower > 0) {
	         mv.addObject("isFollower", isFollower);
	      }
	    
	    mv.addObject("FollowingId", FollowingId);
	    mv.addObject("FollowerId", FollowerId);
		mv.addObject("galleries", galleries);
		mv.addObject("otheruser", otherUser);
		mv.addObject("user", loginUser);
		mv.addObject("followingCount", followingCount);
		mv.addObject("followerCount", followerCount);
		mv.setViewName("post/othermypage");
		
		return mv;
	}
	
	//내가 나의 페이지 들어갈 때
	@RequestMapping(value = "mypage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView moveMyPage(HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelAndView mv) {
		
		User user = (User) session.getAttribute("loginUser");
		ArrayList<Gallery> galleries = new ArrayList<Gallery>();
		ArrayList<Post> posts = postService.selectPostsById(user.getUserId());
		
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
		
		return mv;
	}
	
	@RequestMapping(value = "posting.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView createPost(HttpServletRequest request, HttpServletResponse response, Post post,
			@RequestParam(name = "files", required = false) List<MultipartFile> files,
			@RequestParam(name = "tagName", required = false) String[] tags, ModelAndView mv)
			throws IllegalStateException, IOException, ImageProcessingException {

		logger.info("files : " + files.toString());
		logger.info("UserId : " + post.getUserId());
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

			for (String s : tags) {
				Tag tag = new Tag();
				tag.setPostId(p.getPostId());
				tag.setTagName(s);
				postService.insertTag(tag);
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
		
		
		// 먼저 유저아이디 받아와서 차단 리스트 받아옴
		// ArrayList<String> userIds = friendService.(loginuser.getUserId());
		

		ArrayList<Integer> postIds = new ArrayList<Integer>();
		// 만약 사이즈가 0이면 다른 쿼리문 작동
		if (userIds.size() > 0) {
			// 그걸로 포스트 아이디들을 쭉 받아옴
			logger.info(userIds.toString());
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
				int isFollowed = friendService.selectFollower(friend);
				// 1이면 팔로우중 즉 언팔로우 버튼 필요 0이면 팔로우 안하고 있음 팔로우 버튼 만들어야함

				Like like = new Like(loginUser.getUserId(), Integer.parseInt(eachPostId));
				int isLiked = postService.selectIsLiked(like);
				int whatIsLiked = postService.selectWhatIsLiked(like);
				// 1이면 이미 공감중 0이면 공감안하고 있음

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

	@RequestMapping(value = "detail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView showDetailView(@RequestParam("postId")int postId, ModelAndView mv, HttpSession session) {
	    
		ArrayList<Image> images = postService.selectImagesByPostId(postId);
		logger.info("images" + images.toString());
		Video video = postService.selectOneVideo(postId);
		//logger.info("video" + video.toString());
		//String postUserId = postService.selectUserId(postId);
		//logger.info("postUserId" + postUserId.toString());
		//User postUser = userService.selectUser(postUserId);
		//logger.info("postUser" + postUser.toString());
		User viewingUser = (User) session.getAttribute("loginUser");
		logger.info("viewingUser" + viewingUser.toString());
		Post post = postService.selectOnePost(postId);
		logger.info("post" + post.toString());
		ArrayList<Tag> tags = postService.selectTags(postId);
		logger.info("tags" + tags.toString());
		ArrayList<Comment> comments = commentService.selectComments(postId);
		logger.info("comments" + comments.toString());
		int likeCount = postService.selectLikeCounts(postId);
		logger.info("likeCount" + likeCount);
		
		
	    mv.addObject("images", images);
	    mv.addObject("video", video);
	    mv.addObject("viewingUser", viewingUser);
	    mv.addObject("post", post);
	    mv.addObject("tags", tags);
		mv.addObject("comments", comments);
	    mv.addObject("likeCount", likeCount);
		mv.setViewName("post/detailview");
		
	    return mv;
	}

	
	
	
	
}// 클래스
