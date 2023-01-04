package com.ipms.main.serviceCenter.svcQaA.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaACommentVO;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaACommentVO;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

public interface SvcQaAService {
	
	// Q&A 조회(페이징 가능)
	public List<SvcQaAVO> svcQaASelect(Criteria criteria);
	
	// 페이징을 위한 총 개수 조회
	public int total();
	
	// Q&A 디테일 페이지
	public SvcQaAVO svcQaADetail(String qnaNum);
	
	// Q&A 답글 조회
	public SvcQaACommentVO svcQaACommentSelect(String qnaNum);
	
	// Q&A 생성
	public int svcQaAInsert(SvcQaAVO svcQaAVO);
	
	// Q&A 수정
	public int svcQaAUpdate(SvcQaAVO svcQaAVO);
	
	// Q&A 삭제
	public int svcQaADelete(SvcQaAVO svcQaAVO);
}

