package com.ipms.proj.freeboard.mapper;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

public interface FreeboardMapper {

	public List<FreeboardVO> selectFree();	// 리스트
	
	public FreeboardVO detailFree(FreeboardVO freeboardVO);	// 상세
	
	public int insertFree(FreeboardVO freeboardVO);	// 등록
	
	public int updateFree(FreeboardVO freeboardVO); // 수정

	public int deleteFree(FreeboardVO freeboardVO);	// 삭제
	
	public int ckDelFree(FreeboardVO freeboardVO);	// 글 선택 삭제(PL)

	public List<FreeboardVO> getFreePage(Criteria cri); // 리스트(페이징ver.)
	
	public int getTotal(String projId);
	
	public String[] authCheck(FreeboardVO freeboardVO); // 리더 체크
	
	public FreeboardVO detailFree2(FreeboardVO freeboardVO); // 상세 페이지에서 글 작성자인지 체크(수정,삭제 버튼 유무)
	
}
