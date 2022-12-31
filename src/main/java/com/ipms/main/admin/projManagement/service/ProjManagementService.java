package com.ipms.main.admin.projManagement.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

public interface ProjManagementService {

	public List<ProjManaVO> adminProjList(Criteria cri);
	
	public int getTotal();
	
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO);
}

