package org.edu.intertwine.post.service;

import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;

public interface PostService {
	
	//Like 카운트 확인 후 업데이트 및 인서트 수행
	int selectLikeCount(Like like);
	int updateLike(Like like);
	int insertLike(Like like);
	int selectSameLikeCount(Like like);
	int deleteLike(Like like);
	int updatePrivacy(Post post);
	int selectTagCount(Tag tag);
	int insertTag(Tag tag);
	int deleteTag(Tag tag);
	int deletePost(Post post);

	

}
