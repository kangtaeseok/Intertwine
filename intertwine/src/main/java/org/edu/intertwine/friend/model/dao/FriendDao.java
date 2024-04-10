package org.edu.intertwine.friend.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.friend.model.vo.searchFriend;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("friendDao")
public class FriendDao {

	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertFollowing(Friend friend) {
		return sqlSessionTemplate.insert("friendMapper.insertFollowing", friend);

	}

	public int selectCountFollowing(String userId) {
		return sqlSessionTemplate.selectOne("friendMapper.selectCountFollowing", userId);
	}

	public int selectCountFollowers(String userId) {
		return sqlSessionTemplate.selectOne("friendMapper.selectCountFollowers", userId);
	}

	public int deleteFollowing(Friend friend) {

		return sqlSessionTemplate.delete("friendMapper.deleteFollowing", friend);
	}

	public int blockFollowing(Friend friend) {
		return sqlSessionTemplate.update("friendMapper.blockFollowing", friend);

	}

	public ArrayList<Friend> selectSearchFollowing(Friend friend) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.selectSearchFollowing", friend);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> selectFollowingList(String userId) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.selectFollowingList", userId);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> selectFollowerList(String userId) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.selectFollowerList", userId);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> selectSearchFollower(Friend friend) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.selectSearchFollower", friend);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> blockedList(String userId) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.blockedList", userId);
		return (ArrayList<Friend>) list;
	}

	public int countBlocks(String userId) {
		return sqlSessionTemplate.selectOne("friendMapper.countBlocks", userId);
	}

	public int blockFollower(Friend friend) {
		return sqlSessionTemplate.update("friendMapper.blockFollower", friend);
	}

	public int selectFollowing(Friend friend) {
		return sqlSessionTemplate.selectOne("friendMapper.selectFollowing", friend);
	}
	
	public int selectFollower(Friend friend) {
		return sqlSessionTemplate.selectOne("friendMapper.selectFollower", friend);
	}

	public String selectFollowingId(Friend friend) {
		return sqlSessionTemplate.selectOne("friendMapper.selectFollowingId", friend);
	}

	public String selectFollowerId(Friend friend) {
		return sqlSessionTemplate.selectOne("friendMapper.selectFollowerId", friend);
	}

}
