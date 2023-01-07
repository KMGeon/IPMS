package com.ipms.main.mypage.memSvcQaA.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.mypage.memSvcQaA.mapper.MemSvcQaAMapper;
import com.ipms.main.mypage.memSvcQaA.service.MemSvcQaAService;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

@Service
public class MemSvcQaAServiceImpl implements MemSvcQaAService{
	
	@Autowired
	MemSvcQaAMapper memSvcQaAMapper;
	
	// Q&A 조회
	@Override
	public List<SvcQaAVO> memSvcQaASelect(Criteria criteria) {
		
		List<SvcQaAVO> svcQaASelect = memSvcQaAMapper.memSvcQaASelect(criteria);
		
		return svcQaASelect;
	}
	
	// 데이터 검증 하기
	@Override
	public int memTotal(String memCode) {
		
		return memSvcQaAMapper.memTotal(memCode);
		
	}
}
