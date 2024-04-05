package org.edu.intertwine.post.model.service;

import java.util.ArrayList;

import org.edu.intertwine.post.model.vo.Image;
import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
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

	String selectUserId(int eachPostId);

	Post selectOnePost(int eachPostId);

	Image selectOneImage(int eachPostId);

	Video selectOneVideo(int eachPostId);

	int selectLikeCounts(int eachPostId);

	int selectIsLiked(Like like);

	int selectWhatIsLiked(Like like);

	ArrayList<Post> selectPostsById(String userId);

	ArrayList<Tag> selectTags(int postId);

	ArrayList<Image> selectImagesByPostId(int postId);

	String selectFindUserId(int each);



	/* User selectUser(String findUserId); */

	


	

}
