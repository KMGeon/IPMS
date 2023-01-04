package com.ipms.main.admin.projManagement.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;
import com.ipms.main.newProject.vo.ProjMemVO;

public interface ProjManagementMapper {
	
	public List<ProjManaVO> adminProjList(Criteria cri); 	// 프로젝트 리스트
	
	public int getTotal(Criteria criteria);
	
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO);
	
	public ProjManaVO adminProjDetail2(ProjManaVO projManaVO);
	
	public List<ProjManaVO> adminProjMem(ProjManaVO projManaVO);
	
	public int ckDelProj(ProjManaVO projManaVO);
	
	public int ckRestoreProj(ProjManaVO projManaVO);

}
