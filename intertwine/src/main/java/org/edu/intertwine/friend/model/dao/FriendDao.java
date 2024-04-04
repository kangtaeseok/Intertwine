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

	public int countFollowing(String userId) {
		return sqlSessionTemplate.selectOne("friendMapper.countFollowing", userId);
	}

	public int countFollowers(String userId) {
		return sqlSessionTemplate.selectOne("friendMapper.countFollowers", userId);
	}

	public int deleteFollowing(Friend friend) {

		return sqlSessionTemplate.delete("friendMapper.deleteFollowing", friend);
	}

	public void blockFollowing(Friend friend) {
		sqlSessionTemplate.update("friendMapper.blockFollowing", friend);

	}

	public ArrayList<Friend> searchFollowing(Friend friend) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.searchFollowing", friend);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> FollowingList(String userId) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.FollowingList", userId);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> FollowerList(String userId) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.FollowerList", userId);
		return (ArrayList<Friend>) list;
	}

	public ArrayList<Friend> searchFollower(Friend friend) {
		List<Friend> list = sqlSessionTemplate.selectList("friendMapper.searchFollower", friend);
		return (ArrayList<Friend>) list;
	}

}
