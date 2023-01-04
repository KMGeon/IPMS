package com.ipms.main.mypage.portfolio.mapper;

import java.util.List;

import com.ipms.main.mypage.portfolio.vo.PortfolioVO;
import com.ipms.main.register.vo.TechStackVO;

public interface PortfolioMapper {
	
	// 회원의 기술 스택 조회
	public TechStackVO portfolioTechStackSelect(String memCode);
	
	// 완성된 프로젝트 리스트 조회
	public List<PortfolioVO> completeProjSelect(String memCode);
	
	// 진행 중인 프로젝트 리스트 조회
	public List<PortfolioVO> proceedingProjSelect(String memCode);

}
