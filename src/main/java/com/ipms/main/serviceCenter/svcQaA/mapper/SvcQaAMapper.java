package com.ipms.main.serviceCenter.svcQaA.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

public interface SvcQaAMapper {
	
	// Q&A 조회(페이징 가능)
	public List<SvcQaAVO> svcQaASelect(Criteria criteria);
	
	// 페이징을 위한 총 개수 조회
	public int total();
	
	// Q&A 디테일 페이지
	public SvcQaAVO svcQaADetail(String qnaNum);

	// Q&A 생성
	public int svcQaAInsert(SvcQaAVO svcQaAVO);
	
}
