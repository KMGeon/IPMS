package com.ipms.proj.freeboard.mapper;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.freeboard.vo.FreeboardVO;

public interface FreeboardMapper {

	public List<FreeboardVO> selectFree();	// 리스트
	
	public FreeboardVO detailFree(FreeboardVO freeboardVO);	// 상세
	
	public int insertFree(FreeboardVO freeboardVO);	// 등록
	
	public int updateFree(FreeboardVO freeboardVO); // 수정

	public int deleteFree(FreeboardVO freeboardVO);	// 삭제
	
	public int ckDelFree(FreeboardVO freeboardVO);	// 굴 선택 삭제(PL)

	public List<FreeboardVO> getFreePage(Criteria cri); // 리스트(페이징ver.)
	
	public int getTotal();
	
}
