package org.edu.intertwine.comment.model.service;

import java.util.ArrayList;

import org.edu.intertwine.comment.model.dao.CommentDao;
import org.edu.intertwine.comment.model.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	
	private static final long serialVersionUID = 2315182311719240021L;
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public int selectCommentCounts(int postId) {
		// TODO Auto-generated method stub
		return commentDao.selectCommentCounts(postId);
	}

	@Override
	public ArrayList<Comment> selectComments(int postId) {
		// TODO Auto-generated method stub
		return commentDao.selectComments(postId);
	}

	@Override
	public int insertComment1(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.insertComment1(comment);
	}

	@Override
	public int insertComment2(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.insertComment2(comment);
	}

	@Override
	public int deleteComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.deleteComment(comment);
	}

}
