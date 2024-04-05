package org.edu.intertwine.comment.model.service;

import java.util.ArrayList;

import org.edu.intertwine.comment.model.vo.Comment;

public interface CommentService {

	int selectCommentCounts(int postId);

	ArrayList<Comment> selectComments(int postId);

	int insertComment1(Comment comment);

}