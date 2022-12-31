package com.ipms.main.mypage.memSvcQaA.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

public interface MemSvcQaAMapper {
	
	// Q&A 조회(페이징 가능)
	public List<SvcQaAVO> memSvcQaASelect(Criteria criteria);
	
	// 페이징을 위한 총 개수 조회
	public int memTotal(String memCode);
	
}
