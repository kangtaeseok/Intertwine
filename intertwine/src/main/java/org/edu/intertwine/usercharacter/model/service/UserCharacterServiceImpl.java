package org.edu.intertwine.usercharacter.model.service;

import org.edu.intertwine.usercharacter.model.dao.UserCharacterDao;
import org.edu.intertwine.usercharacter.model.vo.UserCharacter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userCharacterService")
public class UserCharacterServiceImpl implements UserCharacterService {
	@Autowired
	   private UserCharacterDao userCharacterDao;

	@Override
	public UserCharacter selectUserCharacterFirst(String userId) {
		return userCharacterDao.selectUserCharacterFirst(userId);
	}

	@Override
	public UserCharacter selectUserCharacter(String userId) {
		return userCharacterDao.selectUserCharacter(userId);
	}

	@Override
	public int insertUserCharacterFirst(String userId) {
		return userCharacterDao.insertUserCharacterFirst(userId);
	}

	@Override
	public int UpdateUserCharacter(String userId) {
		return userCharacterDao.UpdateUserCharacter(userId);
	}

	@Override
	public int insertUserCharacter(UserCharacter UserCharacter) {
		return userCharacterDao.insertUserCharacter(UserCharacter);
	}

	@Override
	public int deleteUserCharacter(String userId) {
		return userCharacterDao.deleteUserCharacter(userId);
	}
	
	
}
