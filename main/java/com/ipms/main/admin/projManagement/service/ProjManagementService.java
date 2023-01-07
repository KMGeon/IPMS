package com.ipms.main.admin.projManagement.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;
import com.ipms.main.newProject.vo.ProjMemVO;

public interface ProjManagementService {

	public List<ProjManaVO> adminProjList(Criteria cri);
	
	public int getTotal(Criteria criteria);
	
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO);
	
	public ProjManaVO adminProjDetail2(ProjManaVO projManaVO);
	
	public List<ProjManaVO> adminProjMem(ProjManaVO projManaVO);
	
	public int ckDelProj(ProjManaVO projManaVO);
	
	public int ckRestoreProj(ProjManaVO projManaVO);
	
}

