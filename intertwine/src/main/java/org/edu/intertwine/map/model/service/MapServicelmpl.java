package org.edu.intertwine.map.model.service;

import java.util.ArrayList;

import org.edu.intertwine.map.model.dao.MapDao;
import org.edu.intertwine.map.model.vo.Attraction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MapService")
public class MapServicelmpl implements MapService{
	
	@Autowired
	private MapDao mapDao;
	
	@Override
	public ArrayList<Attraction> selectAttraction(){
		return mapDao.selectAttraction();
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		return mapDao.selectSearchTitleCount(keyword);
	}

	@Override
	public Attraction selectSearchTitle(String keyword) {
		return mapDao.selectSearchTitle(keyword);
	}

	

	
	
	
	
	

}
