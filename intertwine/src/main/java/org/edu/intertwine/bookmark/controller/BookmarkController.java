package org.edu.intertwine.bookmark.controller;

import org.edu.intertwine.bookmark.model.service.BookmarkService;
import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);

	@Autowired
	private BookmarkService bookmarkService; // 다형성 이용 (동적바인딩)

	/*
	 * // 북마크 토글 메소드
	 * 
	 * @RequestMapping(value = "*******.do", method = { RequestMethod.POST,
	 * RequestMethod.GET }) public String toggleBookmark(@RequestParam("userId")
	 * String userId, @RequestParam("postId") int postId, Model model) { //
	 * 세션에서사용자id,포스트id를 넘겨받음 // 객체에 담은 다음 있는지 확인함 Bookmark bookmark = new
	 * Bookmark(userId, postId);
	 * 
	 * int check1 = bookmarkService.selectBookmarkCount(bookmark); // 먼저 이 포스트에 북마크를
	 * 한 적이 있는지 확인 if (check1 == 1) { // 있으면 북마크 제거 int check2 =
	 * bookmarkService.deleteBookmark(bookmark); if (check2 > 0) { // 성공 시 일어날 이벤트
	 * 기술 미정************************************** return ""; } else { // 실패 시 에러메시지
	 * model.addAttribute("message", "문제가 발생하였습니다."); return "common/error"; } }
	 * else { // 없으면 북마크 추가 int check2 = bookmarkService.insertBookmark(bookmark);
	 * if (check2 > 0) { // 성공 시 일어날 이벤트 기술 미정 return ""; } else { // 실패 시 에러메시지
	 * model.addAttribute("message", "문제가 발생하였습니다."); return "common/error"; } } }
	 * 
	 * // 북마크된 포스트들을 모조리가져옴 // 세션에서 사용자 확인
	 * 
	 * @RequestMapping(value = "bmark.do", method = { RequestMethod.POST,
	 * RequestMethod.GET }) public ModelAndView getBookmarkPosts() {
	 * 
	 * // SELECT POST_ID //FROM TB_BOOKMARK //WHERE USER_ID = ? // SELECT }
	 */
}