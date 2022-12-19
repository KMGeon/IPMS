package com.ipms.main.serviceCenter.svcQaA.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

public interface SvcQaAMapper {
	
	public List<SvcQaAVO> svcQaASelect(Criteria criteria);
	
	public int total(String memCode);
	
}
