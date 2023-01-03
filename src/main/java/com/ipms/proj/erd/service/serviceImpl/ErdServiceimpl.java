package com.ipms.proj.erd.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.proj.erd.mapper.ErdMapper;
import com.ipms.proj.erd.service.ErdService;
import com.ipms.proj.erd.vo.ErdVO;

@Service
@Transactional
public class ErdServiceimpl implements ErdService{
	
	@Autowired
	ErdMapper erdMapper;
	
	@Override
	public int insertErd(ErdVO erdVO) {
		return erdMapper.insertErd(erdVO);
	}
	
	@Override
	public List<ErdVO> selectVer(ErdVO erdVO){
		return erdMapper.selectVer(erdVO);
	}
	
	@Override
	public ErdVO selectErd(ErdVO erdVO) {
		return erdMapper.selectErd(erdVO);
	}
	
	@Override
	public int erdUpdate(ErdVO erdVO) {
		return erdMapper.erdUpdate(erdVO);
	}
	
	@Override
	public int erdDelete(ErdVO erdVO) {
		return erdMapper.erdDelete(erdVO);
	}
	
}
