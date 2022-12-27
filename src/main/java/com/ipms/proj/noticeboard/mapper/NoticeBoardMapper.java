package com.ipms.proj.noticeboard.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getNtPage(Criteria cri); // 리스트
	
	public int getTotal(); // 게시글 총 개수 
	
	public NoticeBoardVO detailNt(NoticeBoardVO noticeBoardVO); // 게시판 상세 
	
	public int insertNt(NoticeBoardVO noticeBoardVO); // 공지 등록
	
	public int updateNt(NoticeBoardVO noticeBoardVO); // 공지 수정

	public int deleteNt(NoticeBoardVO noticeBoardVO); // 공지 삭제
	
	public int ckDelNt(NoticeBoardVO noticeBoardVO); // 체크박스 선택 삭제
	
}
