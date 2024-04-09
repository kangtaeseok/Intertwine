package org.edu.intertwine.bookmark.controller;

import org.edu.intertwine.bookmark.model.service.BookmarkService;
import org.edu.intertwine.bookmark.model.vo.Bookmark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService bookmarkService;
	
	@RequestMapping("insertBookmark.do")
	public String insertdetailBookmark(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		
		int p = Integer.parseInt(postId);
		Bookmark bookmark = new Bookmark(userId, p);
		bookmarkService.insertBookmark(bookmark);
		
		return "redirect:detail.do?postId=" + postId;
	}
	
	@RequestMapping("insertBookmark2.do")
	public String insertdetail2Bookmark(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		
		int p = Integer.parseInt(postId);
		Bookmark bookmark = new Bookmark(userId, p);
		bookmarkService.insertBookmark(bookmark);
		
		return "redirect:getfeed.do";
	}
	
	@RequestMapping("deleteBookmark.do")
	public String deletedetailBookmark(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		
		int p = Integer.parseInt(postId);
		Bookmark bookmark = new Bookmark(userId, p);
		bookmarkService.deleteBookmark(bookmark);
		
		return "redirect:detail.do?postId=" + postId;
	}
	
	@RequestMapping("deleteBookmark2.do")
	public String deletedetail2Bookmark(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		
		int p = Integer.parseInt(postId);
		Bookmark bookmark = new Bookmark(userId, p);
		bookmarkService.deleteBookmark(bookmark);
		
		return "redirect:getfeed.do";
	}
	
	@RequestMapping("deleteBookmark3.do")
	public String deleteBookmarkFeedBookmark(@RequestParam("postId")String postId, @RequestParam("userId")String userId) {
		
		int p = Integer.parseInt(postId);
		Bookmark bookmark = new Bookmark(userId, p);
		bookmarkService.deleteBookmark(bookmark);
		
		return "redirect:getbookmarkfeed.do";
	}
	
}
