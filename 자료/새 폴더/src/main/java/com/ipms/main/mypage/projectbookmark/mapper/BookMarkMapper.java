package com.ipms.main.mypage.projectbookmark.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.mypage.projectbookmark.vo.BookMarkVO;



public interface BookMarkMapper {

	// 북마크 인설트
	public int bookMarkInsert(BookMarkVO vo); 
	
	// 북마크 리스트 
	public List<BookMarkVO> bookMarkSelectAll(Criteria criteria);
		
	public int bookMarkDel(BookMarkVO vo);
	
	public int totalNum(Criteria criteria);
	
	public List<BookMarkVO> selectBookMark(String memId);
}
