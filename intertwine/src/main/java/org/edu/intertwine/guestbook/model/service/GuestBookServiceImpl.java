package org.edu.intertwine.guestbook.model.service;

import java.util.ArrayList;

import org.edu.intertwine.guestbook.model.dao.GuestBookDao;
import org.edu.intertwine.guestbook.model.vo.GuestBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("guestBookService")
public class GuestBookServiceImpl implements GuestBookService {
	@Autowired
	private GuestBookDao guestBookDao;

	@Override
	public ArrayList<GuestBook> selectGuestBook(String userId) {
		return guestBookDao.selectGuestBook(userId);
	}

	@Override
	public int insertGuestBook(GuestBook guestBook) {
		return guestBookDao.insertGuestBook(guestBook);
	}

}
