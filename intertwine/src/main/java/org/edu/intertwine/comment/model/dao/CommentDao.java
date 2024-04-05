package org.edu.intertwine.comment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.comment.model.vo.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentDao")
public class CommentDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int selectCommentCounts(int postId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("commentMapper.selectCommentCounts", postId);
	}

	public ArrayList<Comment> selectComments(int postId) {
		// TODO Auto-generated method stub
		List<Comment> list = sqlSessionTemplate.selectList("commentMapper.selectComments", postId);
		return (ArrayList<Comment>)list;
	}

	public int insertComment1(Comment comment) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("commentMapper.insertComment1", comment);
	}

	public int insertComment2(Comment comment) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("commentMapper.insertComment2", comment);
	}

}
