package org.edu.intertwine.post.model.service;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.SearchMyPage;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.model.vo.Video;
import org.edu.intertwine.user.model.vo.User;

public interface PostService {
	
	//Like 카운트 확인 후 업데이트 및 인서트 수행
	int insertPost(Post post);

	Post selectLatestPostId();

	int insertVideo(Video video);

	int insertTag(Tag tag);

	int insertImage1(Image image);

	int insertImage2(Image image);
	
	ArrayList<String> selectUserIds(String userId);

	ArrayList<Integer> selectPostIds(ArrayList<String> userIds);

	ArrayList<Integer> selectPostIdsforZero();

	Post selectOnePost(int eachPostId);

	Image selectOneImage(int eachPostId);

	Video selectOneVideo(int eachPostId);

	int selectLikeCounts(int eachPostId);

	int selectIsLiked(Like like);

	String selectWhatIsLiked(Like like);

	ArrayList<Post> selectPostsById(String userId);

	ArrayList<Tag> selectTags(int postId);

	ArrayList<Image> selectImagesByPostId(int postId);

	String selectFindUserId(int each);

	int selectIsPinned(Post pincheck);

	int updatePin1(Post post);

	int updatePin2(Post post);

	int deletePost(Post post);

	int deleteLikeType(Like like1);

	int updateLikeType(Like like2);

	int insertLikeType(Like like2);

	int deleteBatchDelete(List<Integer> postIds);

	int updateBatchPublic(List<Integer> postIds);

	int updateBatchFollowing(List<Integer> postIds);

	int updateBatchPrivate(List<Integer> postIds);

	int updateBatchPinOn(List<Integer> postIds);

	int updateBatchPinOff(List<Integer> postIds);

	ArrayList<Post> selectPostsByIdOldestToNewest(String userId);

	ArrayList<Post> selectPostsByIdMostViewsToLeast(String userId);

	int updatePostViews(Post post);

	ArrayList<Integer> selectBookmarkedPosts(String userId);

	ArrayList<Post> selectPostsBySearchAll(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsBySearchTag(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsBySearchKeyword(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsByIdFollower(String friendId);

	ArrayList<Post> selectPostsByIdNotFollower(String friendId);

	ArrayList<Post> selectPostsByIdOldestToNewestFollower(String friendId);

	ArrayList<Post> selectPostsByIdOldestToNewestNotFollower(String friendId);

	ArrayList<Post> selectPostsByIdMostViewsToLeastFollower(String friendId);

	ArrayList<Post> selectPostsByIdMostViewsToLeastNotFollower(String friendId);

	ArrayList<Post> selectPostsBySearchTagFollower(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsBySearchTagNotFollower(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsBySearchKeywordFollower(SearchMyPage searchMyPage);

	ArrayList<Post> selectPostsBySearchKeywordNotFollower(SearchMyPage searchMyPage);


	//ArrayList<Post> selectPostsByIdMostReactionsToLeast(String userId);



	/* User selectUser(String findUserId); */

	


	

}
