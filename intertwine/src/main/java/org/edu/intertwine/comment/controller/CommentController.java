package org.edu.intertwine.comment.controller;

import org.edu.intertwine.comment.model.service.CommentService;
import org.edu.intertwine.comment.model.vo.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	@Autowired
	CommentService commentService;
	

	//코멘트 삽입
	@RequestMapping(value="addComment1.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String addComment1(@RequestParam("userId")String userId, @RequestParam("postId")String postId, @RequestParam("commentContent")String commentContent, Model model) {
		
		
		logger.info("postId: " + postId);
		logger.info("userId" + userId);
		//아이디와 포스트를 받아서 코멘트 저장처리
		//이 폼에서 저장한 코멘트는 무조건 1번 (부모댓글임)
		Comment comment = new Comment (Integer.parseInt(postId), userId, commentContent);
		
		int result = commentService.insertComment1(comment);
		if(result == 1) {
			
			return "redirect:detail.do?postId=" + postId;
		}else {
			
			model.addAttribute("message", "댓글달기 실패");
			return "redirect:detail.do?postId=" + postId;
		}
		
	}
	
	@RequestMapping(value="addComment2.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String addComment2(@RequestParam("userId")String userId, @RequestParam("postId")int postId, @RequestParam("commentContent")String commentContent, @RequestParam("parentCommentId")int parentCommentId, Model model) {
		
		Comment comment = new Comment (postId, userId, commentContent, parentCommentId);
		int result = commentService.insertComment2(comment);
		
		if(result == 1) {
			
			return "redirect:detail.do?postId=" + postId;
		}else {
			
			model.addAttribute("message", "댓글달기 실패");
			return "redirect:detail.do?postId=" + postId;
		}
		
		
	}
	
	
	@RequestMapping(value="deleteComment.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteComment(@RequestParam("userId")String userId, @RequestParam("commentId")String commentId, @RequestParam("postId")String postId, Model model) {
		
		int c = Integer.parseInt(commentId);
		Comment comment = new Comment (c, userId);
		
		int i = commentService.deleteParentComment(comment.getCommentId());
		int result = commentService.deleteComment(comment);
		
		if(result >= 1) {
			
			return "redirect:detail.do?postId=" + postId;
		}else {
			
			model.addAttribute("message", "댓글삭제 실패");
			return "redirect:detail.do?postId=" + postId;
		}
		
		
	}
	
}
