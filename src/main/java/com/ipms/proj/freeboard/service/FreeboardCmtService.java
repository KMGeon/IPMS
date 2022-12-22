package com.ipms.proj.freeboard.service;

import java.util.List;

import com.ipms.proj.freeboard.vo.FreeboardCmtVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;

public interface FreeboardCmtService {

	public List<FreeboardCmtVO> freeCmtList(FreeboardVO freeboardVO);
}
