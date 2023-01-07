package com.ipms.main.mypage.projectbookmark.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.mypage.projectbookmark.mapper.BookMarkMapper;
import com.ipms.main.mypage.projectbookmark.service.ProjectBookMarkService;
import com.ipms.main.mypage.projectbookmark.vo.BookMarkVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProjectBookMarkServiceImpl implements ProjectBookMarkService {
	
	@Autowired
	BookMarkMapper bookMarkMapper; 
	

	@Override
	public int bookMarkInsert(BookMarkVO vo) {
		log.info("Service --> BookMarkVO : {} ",vo.toString());
		return this.bookMarkMapper.bookMarkInsert(vo);
	}

	@Override
	public List<BookMarkVO> bookMarkSelectAll(Criteria criteria) {	
		// 북마크 getlist
		List<BookMarkVO> list = this.bookMarkMapper.bookMarkSelectAll(criteria);
		log.info("BookMarkService --> return list --> {} " , list.toString());
		
		return 	list;
	}

	@Override
	public int bookMarkDel(BookMarkVO vo) {
		return this.bookMarkMapper.bookMarkDel(vo);
	}

	@Override
	public int totalNum(Criteria criteria) {
		return this.bookMarkMapper.totalNum(criteria);
	}
	
	@Override
	public List<BookMarkVO> selectBookMark(String memId){
		return this.bookMarkMapper.selectBookMark(memId);
	}


}
