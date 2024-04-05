package org.edu.intertwine.post.model.service;

import java.util.ArrayList;

import org.edu.intertwine.post.model.dao.PostDao;
import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("postService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao; 
	
	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return postDao.insertPost(post);
	}

	@Override
	public Post selectLatestPostId() {
		// TODO Auto-generated method stub
		return postDao.selectLatestPostId();
	}

	@Override
	public int insertVideo(Video video) {
		// TODO Auto-generated method stub
		return postDao.insertVideo(video);
	}

	@Override
	public int insertTag(Tag tag) {
		// TODO Auto-generated method stub
		return postDao.insertTag(tag);
	}

	@Override
	public int insertImage1(Image image) {
		// TODO Auto-generated method stub
		return postDao.insertImage1(image);
	}

	@Override
	public int insertImage2(Image image) {
		// TODO Auto-generated method stub
		return postDao.insertImage2(image);
	}

	//나중에 지워야함
	@Override
	public ArrayList<String> selectUserIds(String userId) {
		// TODO Auto-generated method stub
		return postDao.selectUserIds(userId);
	}
	
	@Override
	public ArrayList<Integer> selectPostIds(ArrayList<String> userIds) {
		// TODO Auto-generated method stub
		return postDao.selectPostIds(userIds);
	}

	@Override
	public ArrayList<Integer> selectPostIdsforZero() {
		// TODO Auto-generated method stub
		return postDao.selectPostIdsforZero();
	}

	@Override
	public String selectUserId(int eachPostId) {
		// TODO Auto-generated method stub
		return postDao.selectUserIds(eachPostId);
	}

	@Override
	public Post selectOnePost(int eachPostId) {
		// TODO Auto-generated method stub
		return postDao.selectOnePost(eachPostId);
	}

	@Override
	public Image selectOneImage(int eachPostId) {
		// TODO Auto-generated method stub
		return postDao.selectOneImage(eachPostId);
	}

	@Override
	public Video selectOneVideo(int eachPostId) {
		// TODO Auto-generated method stub
		return postDao.selectOneVideo(eachPostId);
	}

	@Override
	public int selectLikeCounts(int eachPostId) {
		// TODO Auto-generated method stub
		return postDao.selectLikeCounts(eachPostId);
	}

	@Override
	public int selectIsLiked(Like like) {
		// TODO Auto-generated method stub
		return postDao.selectIsLiked(like);
	}

	@Override
	public int selectWhatIsLiked(Like like) {
		// TODO Auto-generated method stub
		return postDao.selectWhatIsLiked(like);
	}

	@Override
	public ArrayList<Post> selectPostsById(String userId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsById(userId);
	}

	@Override
	public ArrayList<Tag> selectTags(int postId) {
		// TODO Auto-generated method stub
		return postDao.selectTags(postId);
	}

	@Override
	public ArrayList<Image> selectImagesByPostId(int postId) {
		// TODO Auto-generated method stub
		return postDao.selectImagesByPostId(postId);
	}

	@Override
	public String selectFindUserId(int each) {
		// TODO Auto-generated method stub
		return postDao.selectFindUserId(each);
	}


	/*
	 * @Override public User selectUser(String findUserId) { // TODO Auto-generated
	 * method stub return postDao.selectUser(findUserId); }
	 */

}
