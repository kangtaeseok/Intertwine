package org.edu.intertwine.comment.model.service;

import java.util.ArrayList;

import org.edu.intertwine.comment.model.vo.Comment;

public interface CommentService {

	int selectCommentCounts(int postId);

	ArrayList<Comment> selectComments(int postId);

	int insertComment1(Comment comment);

	int insertComment2(Comment comment);

	int deleteComment(Comment comment);

	int deleteParentComment(int commentId);
	
	Comment selectCommentbyCommentId(int commentId);


}
