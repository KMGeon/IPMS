package com.ipms.main.mypage.projectbookmark.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.mypage.projectbookmark.vo.BookMarkVO;


public interface ProjectBookMarkService {
		
		public int bookMarkInsert(BookMarkVO vo);
		
		public List<BookMarkVO> bookMarkSelectAll(Criteria criteria);
		
		public int bookMarkDel(@RequestBody BookMarkVO vo);
		
		public int totalNum(Criteria criteria);

		public List<BookMarkVO> selectBookMark(String memId);
		
	}



