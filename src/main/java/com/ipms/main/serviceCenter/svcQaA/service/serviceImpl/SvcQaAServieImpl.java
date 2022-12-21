package com.ipms.main.serviceCenter.svcQaA.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcQaA.mapper.SvcQaAMapper;
import com.ipms.main.serviceCenter.svcQaA.service.SvcQaAService;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

@Service
public class SvcQaAServieImpl implements SvcQaAService{
	
	@Autowired
	SvcQaAMapper svcQaAMapper;
	
	// Q&A 조회
	@Override
	public List<SvcQaAVO> svcQaASelect(Criteria criteria) {
		
		List<SvcQaAVO> svcQaASelect = svcQaAMapper.svcQaASelect(criteria);
		
		return svcQaASelect;
	}
	
	// 데이터 검증 하기
	@Override
	public int total(String memCode) {
		
		return svcQaAMapper.total(memCode);
		
	}
	
	// Q&A 디테일 조회 
	@Override
	public SvcQaAVO svcQaADetail(String qnaNum) {
		
		return svcQaAMapper.svcQaADetail(qnaNum);
		
	}
	
	// Q&A 생성
	@Override
	public int svcQaAInsert(SvcQaAVO svcQaAVO) {
		
		return svcQaAMapper.svcQaAInsert(svcQaAVO);
		
	}
	

}
