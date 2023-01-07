package com.ipms.proj.freeboard.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.freeboard.mapper.FreeboardMapper;
import com.ipms.proj.freeboard.service.FreeboardService;
import com.ipms.proj.freeboard.vo.FreeboardVO;

@Service
public class FreeboardServiceImpl implements FreeboardService {

	@Autowired
	FreeboardMapper freeboardMapper;
	
	@Override
	public List<FreeboardVO> selectFree() {
		
		return this.freeboardMapper.selectFree();
	}

	@Override
	public FreeboardVO detailFree(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.detailFree(freeboardVO);
	}

	@Override
	public int insertFree(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.insertFree(freeboardVO);
	}

	@Override
	public int deleteFree(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.deleteFree(freeboardVO);
	}

	@Override
	public int updateFree(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.updateFree(freeboardVO);
	}

	@Override
	public List<FreeboardVO> getFreePage(Criteria cri) {
		
		return this.freeboardMapper.getFreePage(cri);
	}

	@Override
	public int getTotal(String projId) {
		
		return this.freeboardMapper.getTotal(projId);
	}

	@Override
	public int ckDelFree(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.ckDelFree(freeboardVO);
	}

	@Override
	public String[] authCheck(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.authCheck(freeboardVO);
	}

	@Override
	public FreeboardVO detailFree2(FreeboardVO freeboardVO) {
		
		return this.freeboardMapper.detailFree2(freeboardVO);
	}
	
}
