package org.edu.intertwine.map.model.service;

import java.util.ArrayList;

import org.edu.intertwine.map.model.vo.Attraction;

public interface MapService {

	ArrayList<Attraction> selectAttraction();
	int selectSearchTitleCount(String keyword);
	Attraction selectSearchTitle(String keyword);

	

	
	

}
