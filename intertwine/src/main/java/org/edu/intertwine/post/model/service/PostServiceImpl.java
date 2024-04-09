package org.edu.intertwine.post.model.service;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.post.model.dao.PostDao;
import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.SearchMyPage;
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
	public String selectWhatIsLiked(Like like) {
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

	@Override
	public int selectIsPinned(Post pincheck) {
		// TODO Auto-generated method stub
		return postDao.selectIsPinned(pincheck);
	}

	@Override
	public int updatePin1(Post post) {
		// TODO Auto-generated method stub
		return postDao.updatePin1(post);
	}

	@Override
	public int updatePin2(Post post) {
		// TODO Auto-generated method stub
		return postDao.updatePin2(post);
	}

	@Override
	public int deletePost(Post post) {
		// TODO Auto-generated method stub
		return postDao.deletePost(post);
	}

	@Override
	public int deleteLikeType(Like like1) {
		// TODO Auto-generated method stub
		return postDao.deleteLikeType(like1);
	}

	@Override
	public int updateLikeType(Like like2) {
		// TODO Auto-generated method stub
		return postDao.updateLikeType(like2);
	}

	@Override
	public int insertLikeType(Like like2) {
		// TODO Auto-generated method stub
		return postDao.insertLikeType(like2);
	}

	@Override
	public int deleteBatchDelete(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.deleteBatchDelete(postIds);
	}

	@Override
	public int updateBatchPublic(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.updateBatchPublic(postIds);
	}

	@Override
	public int updateBatchFollowing(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.updateBatchFollowing(postIds);
	}

	@Override
	public int updateBatchPrivate(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.updateBatchPrivate(postIds);
	}

	@Override
	public int updateBatchPinOn(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.updateBatchPinOn(postIds);
	}

	@Override
	public int updateBatchPinOff(List<String> postIds) {
		// TODO Auto-generated method stub
		return postDao.updateBatchPinOff(postIds);
	}

	@Override
	public ArrayList<Post> selectPostsByIdOldestToNewest(String userId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdOldestToNewest(userId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdMostViewsToLeast(String userId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdMostViewsToLeast(userId);
	}

	@Override
	public int updatePostViews(Post post) {
		// TODO Auto-generated method stub
		return postDao.updatePostViews(post);
	}

	@Override
	public ArrayList<Integer> selectBookmarkedPosts(String userId) {
		// TODO Auto-generated method stub
		return postDao.selectBookmarkedPosts(userId);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchAll(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchAll(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchTag(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchTag(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchKeyword(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchKeyword(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsByIdFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdNotFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdNotFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdOldestToNewestFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdOldestToNewestFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdOldestToNewestNotFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdOldestToNewestNotFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdMostViewsToLeastFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdMostViewsToLeastFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsByIdMostViewsToLeastNotFollower(String friendId) {
		// TODO Auto-generated method stub
		return postDao.selectPostsByIdMostViewsToLeastNotFollower(friendId);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchTagFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchTagFollower(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchTagNotFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchTagNotFollower(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchKeywordFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchKeywordFollower(searchMyPage);
	}

	@Override
	public ArrayList<Post> selectPostsBySearchKeywordNotFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		return postDao.selectPostsBySearchKeywordNotFollower(searchMyPage);
	}


	/*
	 * @Override public User selectUser(String findUserId) { // TODO Auto-generated
	 * method stub return postDao.selectUser(findUserId); }
	 */

}
