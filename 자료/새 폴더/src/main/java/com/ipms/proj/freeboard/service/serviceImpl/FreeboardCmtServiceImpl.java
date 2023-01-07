package com.ipms.proj.freeboard.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.freeboard.mapper.FreeboardCmtMapper;
import com.ipms.proj.freeboard.service.FreeboardCmtService;
import com.ipms.proj.freeboard.vo.FreeboardCmtVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;

@Service
public class FreeboardCmtServiceImpl implements FreeboardCmtService{

	@Autowired
	FreeboardCmtMapper freeboardCmtMapper;
	
	@Override
	public List<FreeboardCmtVO> freeCmtList(FreeboardVO freeboardVO) {
		
		return this.freeboardCmtMapper.freeCmtList(freeboardVO);
	}

	@Override
	public int insertFreeCmt(FreeboardCmtVO freeboardCmtVO) {
		
		return this.freeboardCmtMapper.insertFreeCmt(freeboardCmtVO);
	}

	@Override
	public int deleteFreeCmt(FreeboardCmtVO freeboardCmtVO) {
		
		return this.freeboardCmtMapper.deleteFreeCmt(freeboardCmtVO);
	}

	@Override
	public int updateFreeCmt(FreeboardCmtVO freeboardCmtVO) {
		
		return this.freeboardCmtMapper.updateFreeCmt(freeboardCmtVO);
	}
	
}
