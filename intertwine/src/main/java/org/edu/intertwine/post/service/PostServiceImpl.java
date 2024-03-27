package org.edu.intertwine.post.service;

import org.edu.intertwine.post.model.dao.PostDao;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;
import org.springframework.stereotype.Service;

@Service("postService")
public class PostServiceImpl implements PostService {
	
	private PostDao postDao; 
	@Override
	public int updateLike(Like like) {
		// TODO Auto-generated method stub
		return postDao.updateLike(like);
	}
	@Override
	public int selectLikeCount(Like like) {
		// TODO Auto-generated method stub
		return postDao.selectLikeCount(like);
	}
	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return postDao.insertLike(like);
	}
	@Override
	public int selectSameLikeCount(Like like) {
		// TODO Auto-generated method stub
		return postDao.selectSameLikeCount(like);
	}
	@Override
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return postDao.deleteLike(like);
	}
	@Override
	public int updatePrivacy(Post post) {
		// TODO Auto-generated method stub
		return postDao.updatePrivacy(post);
	}
	@Override
	public int selectTagCount(Tag tag) {
		// TODO Auto-generated method stub
		return postDao.selectTagCount(tag);
	}
	@Override
	public int insertTag(Tag tag) {
		// TODO Auto-generated method stub
		return postDao.insertTag(tag);
	}
	@Override
	public int deleteTag(Tag tag) {
		// TODO Auto-generated method stub
		return postDao.deleteTag(tag);
	}
	@Override
	public int deletePost(Post post) {
		// TODO Auto-generated method stub
		return postDao.deletePost(post);
	}

}
