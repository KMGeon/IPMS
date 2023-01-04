package com.ipms.main.admin.projManagement.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.projManagement.mapper.ProjManagementMapper;
import com.ipms.main.admin.projManagement.service.ProjManagementService;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;
import com.ipms.main.newProject.vo.ProjMemVO;

@Service
public class ProjManagementImpl implements ProjManagementService {
	
	@Autowired
	ProjManagementMapper projManagementMapper;

	@Override
	public ProjManaVO adminProjDetail(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.adminProjDetail(projManaVO);
	}

	@Override
	public List<ProjManaVO> adminProjList(Criteria cri) {
		
		return this.projManagementMapper.adminProjList(cri);
	}

	@Override
	public int getTotal(Criteria criteria) {
		
		return this.projManagementMapper.getTotal(criteria);
	}

	@Override
	public ProjManaVO adminProjDetail2(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.adminProjDetail2(projManaVO);
	}

	@Override
	public List<ProjManaVO> adminProjMem(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.adminProjMem(projManaVO);
	}

	@Override
	public int ckDelProj(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.ckDelProj(projManaVO);
	}

	@Override
	public int ckRestoreProj(ProjManaVO projManaVO) {
		
		return this.projManagementMapper.ckRestoreProj(projManaVO);
	}
	

}
