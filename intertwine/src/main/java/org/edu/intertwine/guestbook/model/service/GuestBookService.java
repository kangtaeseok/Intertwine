package org.edu.intertwine.guestbook.model.service;

import java.util.ArrayList;

import org.edu.intertwine.guestbook.model.vo.GuestBook;


public interface GuestBookService {
	ArrayList<GuestBook> selectGuestBook(String userId);
	
	int insertGuestBook(GuestBook guestBook);
}
