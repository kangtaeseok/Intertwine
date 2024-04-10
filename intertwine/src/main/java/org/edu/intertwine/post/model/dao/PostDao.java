package org.edu.intertwine.post.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.SearchMyPage;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.user.model.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("postDao")
public class PostDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertPost", post);
	}
	public Post selectLatestPostId() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectLatestPostId");
	}
	public int insertVideo(Video video) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertVideo", video);
	}
	public int insertTag(Tag tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertTag", tag);
	}
	public int insertImage1(Image image) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertImage1", image);
	}
	public int insertImage2(Image image) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertImage2", image);
	}

	public ArrayList<String> selectUserIds(String userId) {
		// TODO Auto-generated method stub
		List<String> userIds = sqlSessionTemplate.selectList("postMapper.selectUserIds", userId);
		return (ArrayList<String>)userIds;
	}
	
	public ArrayList<Integer> selectPostIds(ArrayList<String> userIds) {
		// TODO Auto-generated method stub
		
		List<Integer> castedPostIds = sqlSessionTemplate.selectList("postMapper.selectPostIds", userIds);
		
		return (ArrayList<Integer>)castedPostIds;
	}
	public ArrayList<Integer> selectPostIdsforZero() {
		// TODO Auto-generated method stub
		
		List<Integer> castedPostIds = sqlSessionTemplate.selectList("postMapper.selectPostIdsforZero");
		
		return (ArrayList<Integer>)castedPostIds;
	}
	public String selectUserIds(int eachPostId) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectOne("postMapper.selectUserIds", eachPostId);
	}
	public Post selectOnePost(int eachPostId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectOnePost", eachPostId);
	}
	public Image selectOneImage(int eachPostId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectOneImage", eachPostId);
	}
	public Video selectOneVideo(int eachPostId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectOneVideo", eachPostId);
	}
	public int selectLikeCounts(int eachPostId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectLikeCounts", eachPostId);
	}
	public int selectIsLiked(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectIsLiked", like);
	}
	public String selectWhatIsLiked(Like like) {
		// TODO Auto-generated method stub
		if(sqlSessionTemplate.selectOne("postMapper.selectWhatIsLiked", like) != null) {
			return sqlSessionTemplate.selectOne("postMapper.selectWhatIsLiked", like);
		}else {
			return null;
		}
	}

	public ArrayList<Post> selectPostsById(String userId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsById", userId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdOldestToNewest(String userId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdOldestToNewest", userId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdMostViewsToLeast(String userId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdMostViewsToLeast", userId);
		return (ArrayList<Post>)list;
	}
	/*
	public ArrayList<Post> selectPostsByIdMostReactionsToLeast(String userId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdMostReactionsToLeast", userId);
		return (ArrayList<Post>)list;
	}
	*/
	public ArrayList<Tag> selectTags(int postId) {
		// TODO Auto-generated method stub
		List<Tag> list = sqlSessionTemplate.selectList("postMapper.selectTags", postId);
		return (ArrayList<Tag>)list;
	}
	public ArrayList<Image> selectImagesByPostId(int postId) {
		// TODO Auto-generated method stub
		List<Image> list = sqlSessionTemplate.selectList("postMapper.selectImagesByPostId", postId);
		return (ArrayList<Image>)list;
	}
	
	public String selectFindUserId(int each) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectFindUserId", each);
	}
	public int selectIsPinned(Post pincheck) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectIsPinned", pincheck);
	}
	public int updatePin1(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updatePin1", post);
	}
	public int updatePin2(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updatePin2", post);
	}
	public int deletePost(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deletePost", post);
	}
	public int deleteLikeType(Like like1) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deleteLikeType", like1);
	}
	public int updateLikeType(Like like2) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateLikeType", like2);
	}
	public int insertLikeType(Like like2) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertLikeType", like2);
	}
	public int deleteBatchDelete(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deleteBatchDelete", postIds);
	}
	public int updateBatchPublic(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateBatchPublic", postIds);
	}
	public int updateBatchFollowing(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateBatchFollowing", postIds);
	}
	public int updateBatchPrivate(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateBatchPrivate", postIds);
	}
	public int updateBatchPinOn(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateBatchPinOn", postIds);
	}
	public int updateBatchPinOff(List<Integer> postIds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateBatchPinOff", postIds);
	}
	public int updatePostViews(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updatePostViews", post);
	}
	public ArrayList<Integer> selectBookmarkedPosts(String userId) {
		// TODO Auto-generated method stub
		List<Integer> list = sqlSessionTemplate.selectList("postMapper.selectBookmarkedPosts", userId);
		return (ArrayList<Integer>)list;
	}
	public ArrayList<Post> selectPostsBySearchAll(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchAll", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchTag(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchTag", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchKeyword(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchKeyword", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdNotFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdNotFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdOldestToNewestFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdOldestToNewestFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdOldestToNewestNotFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdOldestToNewestNotFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdMostViewsToLeastFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdMostViewsToLeastFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsByIdMostViewsToLeastNotFollower(String friendId) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsByIdMostViewsToLeastNotFollower", friendId);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchTagFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchTagFollower", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchTagNotFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchTagNotFollower", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchKeywordFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchKeywordFollower", searchMyPage);
		return (ArrayList<Post>)list;
	}
	public ArrayList<Post> selectPostsBySearchKeywordNotFollower(SearchMyPage searchMyPage) {
		// TODO Auto-generated method stub
		List<Post> list = sqlSessionTemplate.selectList("postMapper.selectPostsBySearchKeywordNotFollower", searchMyPage);
		return (ArrayList<Post>)list;
	}


}