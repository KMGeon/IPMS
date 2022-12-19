package com.ipms.proj.freeboard.service;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;

public interface FreeboardService {

	public List<FreeboardVO> selectFree();
	
	public FreeboardVO detailFree(FreeboardVO freeboardVO);
	
	public int insertFree(FreeboardVO freeboardVO);
	
	public int updateFree(FreeboardVO freeboardVO);
	
	public int deleteFree(FreeboardVO freeboardVO);
	
	public int insertFile(IntgAttachFileVO intgAttachFileVO);
	
	public int selectFreeNum();
}
