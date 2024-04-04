package org.edu.intertwine.userroom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.edu.intertwine.userroom.model.vo.UserRoom;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userRoomDao")
public class UserRoomDao {
	// 마이바이스 매퍼 파일에 쿼리문 별도로 작성함
	// root-context.xml 에 지정된 마이바티스 연결 객체를 사용함
	@Autowired // root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

//
//   //공지사항 페이지 단위로 목록 조회 : 공지사항 목록보기용
//   public ArrayList<Notice> selectList(Paging paging){
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList", paging);
//      return (ArrayList<Notice>)list;
//   }
//   
	// 공지글번호로 한 개 조회 : 공지사항 상세보기용
	public UserRoom selectUserRoom(String userId) {
		System.out.println("dao:" + userId);
		return sqlSessionTemplate.selectOne("userRoomMapper.selectUserRoom", userId);
	}
//   
//   //새 공지글 등록
//   public int insertNotice(Notice notice) {
//      return sqlSessionTemplate.insert("noticeMapper.insertNotice", notice);
//   }
//   
//   //공지글 수정
//   public int updateNotice(Notice notice) {
//      return sqlSessionTemplate.update("noticeMapper.updateNotice", notice);
//   }
//   
//   //공지글 삭제
//   public int deleteNotice(int noticeNo) {
//      return sqlSessionTemplate.delete("noticeMapper.deleteNotice", noticeNo);
//   }
//   
//   //새 공지글 3개를 리턴 : 작성날짜로 top-3 분석 이용함
//   public ArrayList<Notice> selectTop3(){
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectTop3");
//      return (ArrayList<Notice>)list;
//   }
//
//   public int getListCount() {
//      return sqlSessionTemplate.selectOne("noticeMapper.getListCount");
//   }
//
//   public int getSearchTitleCount(String keyword) {
//      return sqlSessionTemplate.selectOne("noticeMapper.getSearchTitleCount", keyword);
//   }
//
//   public int getSearchContentCount(String keyword) {
//      return sqlSessionTemplate.selectOne("noticeMapper.getSearchContentCount", keyword);
//   }
//
//   public int getSearchDateCount(SearchDate date) {
//      return sqlSessionTemplate.selectOne("noticeMapper.getSearchDateCount", date);
//   }
//
//   public ArrayList<Notice> selectSearchTitle(Search search) {
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchTitle", search);
//      return (ArrayList<Notice>)list;
//   }
//   
//   public ArrayList<Notice> selectSearchTitle(String keyword) {
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchTitleKeyword", keyword);
//      return (ArrayList<Notice>)list;
//   }
//
//   public ArrayList<Notice> selectSearchContent(Search search) {
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchContent", search);
//      return (ArrayList<Notice>)list;
//   }
//
//   public ArrayList<Notice> selectSearchDate(Search search) {
//      List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchDate", search);
//      return (ArrayList<Notice>)list;
//   }
//
//   public int addReadCount(int noticeNo) {
//      return sqlSessionTemplate.update("noticeMapper.addReadCount", noticeNo);
//   }
//   
//   public Notice selectLast() {
//      return sqlSessionTemplate.selectOne("noticeMapper.selectLast");
//   }
}
