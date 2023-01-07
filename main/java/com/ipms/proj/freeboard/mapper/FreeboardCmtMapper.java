package com.ipms.proj.freeboard.mapper;

import java.util.List;

import com.ipms.proj.freeboard.vo.FreeboardCmtVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;

public interface FreeboardCmtMapper {

	// 댓걸 select
	public List<FreeboardCmtVO> freeCmtList(FreeboardVO freeboardVO);
	
	public int insertFreeCmt(FreeboardCmtVO freeboardCmtVO); // 댓글 등록
	
	public int updateFreeCmt(FreeboardCmtVO freeboardCmtVO); // 댓글 수정
	
	public int deleteFreeCmt(FreeboardCmtVO freeboardCmtVO); // 댓글 삭제
}
