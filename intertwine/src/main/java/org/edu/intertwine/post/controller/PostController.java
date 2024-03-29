package org.edu.intertwine.post.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.edu.intertwine.common.FileNameChange;
import org.edu.intertwine.common.GPS;
import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.post.service.PostService;
import org.json.simple.JSONArray;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Autowired
	private PostService postService; // 다형성 이용 (동적바인딩)

	@RequestMapping("create.do")
	public String moveCreate() {
		return "post/write";
	}

	@RequestMapping("attach.do")
	public String moveAttachment() {
		return "post/attachment";
	}
	
	@RequestMapping("mypage.do")
	public String moveMyPage() {
		return "post/mypage";
	}

	/*
	 * // 게시글 공감 추가 및 업데이트 완료 // Ajax 비동기 통신 비동기 통신은 @ResponseBody 태그 추가
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET })
	 * 
	 * @ResponseBody public String updateLike(Like like, Model model) { // 먼저 이 포스트에
	 * 이 유저가 공감을 표시한 적이 있는 지 확인 // 1은 있음 0은 없음 0의 경우 insert 1의 경우 업데이트 또는 제거 if
	 * (postService.selectLikeCount(like) > 0) { // 이 유저가 이 포스트에 공감한 적이 있는 지 체크 if
	 * (postService.selectSameLikeCount(like) > 0) { // 그럼 같은 공감을 클릭한건지 아닌지 확인 int
	 * check = postService.deleteLike(like); // 같은 공감이 한 번 더 클릭됨 -> 삭제조치 if (check >
	 * 0) { // 성공 시 일어날 이벤트 기술 미정 return ""; } else { // 실패 시 에러 메시지
	 * model.addAttribute("message", "문제가 발생하였습니다."); return "common/error"; } }
	 * else { // 다른 공감이 클릭됨 -> 업데이트 int check = postService.updateLike(like); if
	 * (check > 0) { // 성공 이벤트 기술 return ""; } else { // 실패 이벤트 기술
	 * model.addAttribute("message", "문제가 발생하였습니다."); return "common/error"; } }
	 * 
	 * } else { // 없으면 공감 추가 int check = postService.insertLike(like); if (check >
	 * 0) { // 성공 return ""; } else {
	 * 
	 * // 실패 model.addAttribute("message", "문제가 발생하였습니다."); return "common/error"; }
	 * 
	 * }
	 * 
	 * }// updatelike 메소드 끝
	 * 
	 * // 마이 페이지에 포스트 불러오기 **수정필요** // 인피니트 로딩의 경우
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET }) public ModelAndView
	 * getPostsForMyPage(Post post, ModelAndView mv) throws
	 * UnsupportedEncodingException { // 포스트 카운트를 확인 함 int postCount =
	 * postService.selectPostsCountForMyPage(post); if (postCount > 0) { // 모든걸 불러오진
	 * 않고 항상 15개씩 최신순 불러옴 // 불러올 정보 : 포스트/사진/공감 JSONArray jarr = new JSONArray();
	 * 
	 * } else { mv.addObject("message", "아직 작성된 포스트가 없습니다.");
	 * 
	 * }
	 * 
	 * }
	 * 
	 * // 피드에 포스트 불러오기 **수정필요**
	 * 
	 * @RequestMapping(value =
	 * "#####################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET })
	 * 
	 * @ResponseBody public ModelAndView getPostsForFeed(Post post, ModelAndView
	 * mv, @RequestParam("checked") int checked) { int postCount =
	 * postService.selectPostsCountForFeed(post); // JS에서 넘겨받은 변수로 확인한 포스트 갯수 확인
	 * JS에서 계속 합쳐서 보내야함 // 포스트 갯수 확인 if (postCount > 0) { // 포스트가 1개 이상 있을 시 // JS에서
	 * 갯수를 받아서 남은 볼 수 있는 포스트 갯수 설정 // JS에서 계속 갯수를 합산해야함 int leftCount = postCount -
	 * checked;
	 * 
	 * if (leftCount > 0) { // 포스트 불러오기 //불러올 때 필요한 정보 // 먼저 포스트 ID 받아옴 그 아이디로 포스트
	 * 만든이 // SELECT USER_ID FROM TB_POST WHERE POST_ID = ? // 사용자 사진, SELECT
	 * IMAGE_URL FROM TB_IMAGE WHERE POST_ID = ? // 위치, COMMON - GPS에서 추출 후
	 * 카카오API사용해서 출력 // 포스트 사진,(추가 사진 확인은 포스트 상세보기로 가능) // SELECT IMAGE_URL FROM
	 * TB_IMAGE WHERE POST_ID= ? // 동영상, SELECT VIDEO_URL FROM TB_VIDEO WHERE
	 * POST_ID = ? // 공감수, SELECT COUNT(*) FROM TB_LIKE WHERE POST_ID = ? // (댓글은 전체
	 * 댓글보기 눌러야만 나옴 그래서 여긴 안 가져옴) } else {
	 * 
	 * // 확인 가능한 모든 포스트를 확인했어요 mv.addObject("message", "확인 가능한 모든 포스트를 확인했어요"); } }
	 * else { // 어떤 포스트도 없음 mv.addObject("message", "아직 포스트가 없습니다.");
	 * mv.setViewName("common/error"); }
	 * 
	 * return mv; }
	 * 
	 * // 포스트 개별 프라이버시 설정 업데이트 **완료** public String updatePrivacy(Post post, Model
	 * model) {
	 * 
	 * int check = postService.updatePrivacy(post); if (check > 0) { // 성공 return
	 * ""; } else { // 실패 model.addAttribute("message", "문제가 발생하였습니다."); return
	 * "common/error"; } }// updatePrivacy
	 * 
	 * // 태그 추가
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET }) public String addTag(Tag tag, Model
	 * model) { // 포스트 태그 추가 포스트 아이디로 발급됨 거기서 태그 추가 아이디 전달받음 int check1 =
	 * postService.selectTagCount(tag); // 전달받은 두 컴비네이션 존재확인 if (check1 == 0) { //
	 * 0이면 추가 int check2 = postService.insertTag(tag); if (check2 == 1) { // 추가 성공
	 * return ""; } else { // 실패 model.addAttribute("message",
	 * "태그 추가에 문제가 발생했습니다."); return "common/error"; } } else { // 태그 존재함
	 * model.addAttribute("message", "이미 있는 태그입니다."); return "common/error"; }
	 * 
	 * }
	 * 
	 * // 포스트에서 태그 제거
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET }) public String removeTag(Tag tag,
	 * Model model) { // 전달받은 두 컴비네이션 존재확인 int check1 =
	 * postService.selectTagCount(tag);
	 * 
	 * if (check1 == 1) { // 있으면 제거 int check2 = postService.deleteTag(tag); if
	 * (check2 == 1) { // 성공 return ""; } else { // 실패 model.addAttribute("message",
	 * "태그 제거에 문제가 발생했습니다."); return "common/error"; }
	 * 
	 * } else { // 없는 태그 지우려고 함 model.addAttribute("message", "존재하지 않는 태그입니다.");
	 * return "common/error"; } }
	 * 
	 * // 최근 공감 3개 불러오기 (개별 포스트 카드에서 사용)
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET }) public String getLastest3Likes() {
	 * // 불러와야 하는 것 최근 공감 3개 타입과 프로필 사진, 닉네임 // 또한 이들은 클릭 가능해야함 }
	 * 
	 * //포스트 제거
	 * 
	 * @RequestMapping(value =
	 * "######################미완성############################.do", method = {
	 * RequestMethod.POST, RequestMethod.GET }) public String removePost(Post post,
	 * Model model) { // 아마도 그냥 세션 확인해서 사용자 id와 지우려는 포스트의 사용자 id확인은 c태그로 할듯 // 그렇게
	 * 관리자 역시 지울 수 있음 그 포스트를 만든 사용자가 아닐 경우 그냥 삭제버튼을 가려버림 // 지울 수 있는 사람의 경우 지울
	 * postId넘겨받아 지워버림 int check = postService.deletePost(post); // 하지만 같이 딸린 공감,
	 * 댓글, 태그 지워짐 -> 트리거로 해결함 if (check == 1) { //성공 return ""; } else { //실패
	 * model.addAttribute("message", "포스트 제거에 문제가 발생했습니다."); return "common/error";
	 * }
	 * 
	 * }
	 * 
	 * //포스트 생성 아마도 제일 어려울듯 함
	 * 
	 * @RequestMapping(value = "create.do", method = RequestMethod.POST) public
	 * ModelAndView createPost(HttpServletRequest request, HttpServletResponse
	 * response, @RequestParam("detail") String detail,
	 * 
	 * @RequestParam(name = "files",required=false) MultipartFile[] files, Post
	 * post, RedirectAttributes redirectAttributes) { //로그 추가 필요
	 * 
	 * //사용자 확인 부분 필요
	 * 
	 * //포스트 저장 우선 그다음 포스트 아이디 필요 postService.insertPost(post);
	 * 
	 * //가장 최신의 포스트 아이디 찾아옴 거기서 postId 가져옴
	 * 
	 * //사진 저장 및 동영상 저장 필요 if(files != null && files.length > 0) { for(MultipartFile
	 * mf : files) { //업로드된 파일이 사진인지 동영상인지 확장자로 판별 String originalFileName =
	 * mf.getOriginalFilename(); String fileExtension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".") +
	 * 1).toLowerCase();
	 * 
	 * if ("jpg".equals(fileExtension) || "png".equals(fileExtension)) { String
	 * renameFileName = null; if (originalFileName != null &&
	 * originalFileName.length() > 0) { renameFileName =
	 * FileNameChange.change(originalFileName, "yyyyMMddHHmmss");
	 * logger.info("첨부파일명 변경 확인: " + originalFileName + ", " + renameFileName); //
	 * 지정한 저장 폴더에 파일명 변경 처리 String savePath =
	 * request.getSession().getServletContext().getRealPath("resources/postimage");
	 * mf.transferTo(new File(savePath + "\\" + renameFileName)); GPS gps = new
	 * GPS(); //이거 확정아님 double[] gpsdata = gps.getGPS(savePath + "\\" +
	 * renameFileName); if(gpsdata != null) { //위도 경도 있을 시 double lon = gpsdata[0];
	 * double lat = gpsdata[1]; Image image = new Image(//포스트 아이디 ,lon, lat,
	 * savePath + "\\" + renameFileName); postService.insertPhoto(image); } else {
	 * //위도 경도 없을 시 Image image = new Image(//포스트 아이디 , savePath + "\\" +
	 * renameFileName); postService.insertPhoto(image); }
	 * 
	 * }
	 * 
	 * if ("mp4".equals(fileExtension)) { String renameFileName2 = null; if
	 * (originalFileName != null && originalFileName.length() > 0) { renameFileName2
	 * = FileNameChange.change(originalFileName, "yyyyMMddHHmmss");
	 * logger.info("첨부파일명 변경 확인: " + originalFileName + ", " + renameFileName2); //
	 * 지정한 저장 폴더에 파일명 변경 처리 String savePath =
	 * request.getSession().getServletContext().getRealPath("resources/postvideo");
	 * mf.transferTo(new File(savePath + "\\" + renameFileName2)); Video video = new
	 * Video(//여기는 포스트 아이디 들어감 ,savePath + "\\" + renameFileName2);
	 * postService.insertVideo(video);
	 * 
	 * 
	 * }
	 * 
	 * //응답문자 보내기
	 * 
	 * } }
	 * 
	 * }
	 */
}
