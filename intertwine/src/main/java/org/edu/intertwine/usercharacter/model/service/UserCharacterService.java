package org.edu.intertwine.usercharacter.model.service;

import org.edu.intertwine.usercharacter.model.vo.UserCharacter;

public interface UserCharacterService {
	
	UserCharacter selectUserCharacterFirst(String userId);
	
	UserCharacter selectUserCharacter(String userId);
	
	int UpdateUserCharacter(UserCharacter UserCharacter);
	
	int insertUserCharacterFirst(String userId);
	
	int insertUserCharacter(UserCharacter UserCharacter);
	
	int deleteUserCharacter(String userId);

}
