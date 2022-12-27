package com.ipms.proj.freeboard.service;

import java.util.List;

import com.ipms.proj.freeboard.vo.FreeboardCmtVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;

public interface FreeboardCmtService {

	public List<FreeboardCmtVO> freeCmtList(FreeboardVO freeboardVO);
	
	public int insertFreeCmt(FreeboardCmtVO freeboardCmtVO);
	
	public int deleteFreeCmt(FreeboardCmtVO freeboardCmtVO);
	
	public int updateFreeCmt(FreeboardCmtVO freeboardCmtVO);
}
