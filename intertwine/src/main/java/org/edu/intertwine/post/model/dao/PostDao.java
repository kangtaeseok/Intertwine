package org.edu.intertwine.post.model.dao;

import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("postDao")
public class PostDao {

	private SqlSessionTemplate sqlSessionTemplate;
	public int updateLike(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updateLike", like);
	}
	public int selectLikeCount(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectLikeCount", like);
	}
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertLike", like);
	}
	public int selectSameLikeCount(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectSameLikeCount", like);
	}
	public int deleteLike(Like like) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deleteLike", like);
	}
	public int updatePrivacy(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("postMapper.updatePrivacy", post);
	}
	public int selectTagCount(Tag tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postMapper.selectTagCount", tag);
	}
	public int insertTag(Tag tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("postMapper.insertTag", tag);
	}
	public int deleteTag(Tag tag) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deleteTag", tag);
	}
	public int deletePost(Post post) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("postMapper.deletePost", post);
	}

}
