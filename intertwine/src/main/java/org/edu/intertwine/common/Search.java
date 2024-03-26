package org.edu.intertwine.common;

import java.sql.Date;

public class Search {
   private String keyword;   
   private int age;      // 나이 검색시
   private int startRow;   // 페이지 시작행
   private int endRow;   // 페이지 끝행
   private Date begin;      // 가입 날짜 검색시 시작날짜
   private Date end;      // 가입 날짜 검색시 끝날짜
   
   public Search() {
      super();
   }

   public String getKeyword() {
      return keyword;
   }

   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }

   public int getAge() {
      return age;
   }

   public void setAge(int age) {
      this.age = age;
   }

   public int getStartRow() {
      return startRow;
   }

   public void setStartRow(int startRow) {
      this.startRow = startRow;
   }

   public int getEndRow() {
      return endRow;
   }

   public void setEndRow(int endRow) {
      this.endRow = endRow;
   }

   public Date getBegin() {
      return begin;
   }

   public void setBegin(Date begin) {
      this.begin = begin;
   }

   public Date getEnd() {
      return end;
   }

   public void setEnd(Date end) {
      this.end = end;
   }

   @Override
   public String toString() {
      return "Search [keyword=" + keyword + ", age=" + age + ", startRow=" + startRow + ", endRow=" + endRow
            + ", begin=" + begin + ", end=" + end + "]";
   }
   
}
