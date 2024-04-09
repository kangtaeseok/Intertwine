package org.edu.intertwine.usercharacter.model.service;

import java.util.ArrayList;

import org.edu.intertwine.usercharacter.model.vo.UserCharacter;

public interface UserCharacterService {
	
	UserCharacter selectUserCharacterFirst(String userId);
	
	UserCharacter selectUserCharacter(String userId);
	
	int updateUserCharacter(UserCharacter UserCharacter);
	
	int insertUserCharacterFirst(String userId);
	
	int insertUserCharacter(UserCharacter UserCharacter);
	
	int deleteUserCharacter(String userId);

	ArrayList<UserCharacter> selectUserCharacterHair();

	ArrayList<UserCharacter> selectUserCharacterHat();

	ArrayList<UserCharacter> selectUserCharactertop();

	ArrayList<UserCharacter> selectUserCharacterbottom();

}
