package org.edu.intertwine.usercharacter.model.service;

import java.util.ArrayList;

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
	public int updateUserCharacter(UserCharacter UserCharacter) {
		return userCharacterDao.updateUserCharacter(UserCharacter);
	}
	
	@Override
	public int insertUserCharacterFirst(String userId) {
		return userCharacterDao.insertUserCharacterFirst(userId);
	}

	@Override
	public int insertUserCharacter(UserCharacter UserCharacter) {
		return userCharacterDao.insertUserCharacter(UserCharacter);
	}

	@Override
	public int deleteUserCharacter(String userId) {
		return userCharacterDao.deleteUserCharacter(userId);
	}

	@Override
	public ArrayList<UserCharacter> selectUserCharacterHair() {
		return userCharacterDao.selectUserCharacterHair();
	}

	@Override
	public ArrayList<UserCharacter> selectUserCharacterHat() {
		return userCharacterDao.selectUserCharacterHat();
	}

	@Override
	public ArrayList<UserCharacter> selectUserCharactertop() {
		return userCharacterDao.selectUserCharactertop();
	}

	@Override
	public ArrayList<UserCharacter> selectUserCharacterbottom() {
		return userCharacterDao.selectUserCharacterbottom();
	}
	
	
}
