package org.edu.intertwine.map.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.map.model.vo.Attraction;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mapDao")
public class MapDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//관광지 불러오기
	public ArrayList<Attraction> selectAttraction() {
		List<Attraction> list = sqlSessionTemplate.selectList("attractionMapper.selectAttraction");
		return (ArrayList<Attraction>)list;
	}


	public int selectSearchTitleCount(String keyword) {
		return sqlSessionTemplate.selectOne("attractionMapper.selectSearchTitleCount", keyword);
	}
	

	public Attraction selectSearchTitle(String keyword) {
		return sqlSessionTemplate.selectOne("attractionMapper.selectSearchTitle", keyword);
	}




	

	
	
	


}
