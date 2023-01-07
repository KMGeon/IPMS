package com.ipms.main.mypage.portfolio.service.serviceImpl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.main.mypage.portfolio.mapper.PortfolioMapper;
import com.ipms.main.mypage.portfolio.service.PortfolioService;
import com.ipms.main.mypage.portfolio.vo.PortfolioVO;
import com.ipms.main.register.vo.TechStackVO;

@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	PortfolioMapper portfolioMapper;
	
	@Override
	public TechStackVO portfolioTechStackSelect(String memCode) {
		
		return portfolioMapper.portfolioTechStackSelect(memCode);
		
	}
	
	@Override
	public List<PortfolioVO> completeProjSelect(String memCode) {
		
		List<PortfolioVO> completeProjSelect = portfolioMapper.completeProjSelect(memCode);
		
		for (PortfolioVO portfolioVO : completeProjSelect) {
			
			if(portfolioVO.getMemAuth().equals("ROLE_PROJECT_LEADER")) {
				portfolioVO.setMemAuth("리더");
			}else {
				portfolioVO.setMemAuth("팀원");
			}
			
		}
		
		return completeProjSelect;
		
	}

	@Override
	public List<PortfolioVO> proceedingProjSelect(String memCode) {
		
		List<PortfolioVO> proceedingProjSelect = portfolioMapper.proceedingProjSelect(memCode);
		
		for (PortfolioVO portfolioVO : proceedingProjSelect) {
			
			if(portfolioVO.getMemAuth().equals("ROLE_PROJECT_LEADER")) {
				portfolioVO.setMemAuth("리더");
			}else {
				portfolioVO.setMemAuth("팀원");
			}
			
		}
		
		return proceedingProjSelect;
		
	}


}
