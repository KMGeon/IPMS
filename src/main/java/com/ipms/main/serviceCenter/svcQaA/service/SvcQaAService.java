package com.ipms.main.serviceCenter.svcQaA.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

public interface SvcQaAService {
	
	// Q&A 조회
	public List<SvcQaAVO> svcQaASelect(Criteria criteria);
	
	public int total(String memCode);
}
