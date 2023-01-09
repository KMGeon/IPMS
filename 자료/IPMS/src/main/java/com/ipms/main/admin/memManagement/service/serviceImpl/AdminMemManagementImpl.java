package com.ipms.main.admin.memManagement.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.memManagement.mapper.AdminMemManagementMapper;
import com.ipms.main.admin.memManagement.service.AdminMemManagementService;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

@Service
public class AdminMemManagementImpl implements AdminMemManagementService {

	@Autowired
	AdminMemManagementMapper adminMemManagementMapper;
	
	@Override
	public List<AdminMemVO> adminMemList(Criteria cri) {
		
		return this.adminMemManagementMapper.adminMemList(cri);
	}
	
	@Override
	public int getTotal(Criteria criteria) {
		
		return this.adminMemManagementMapper.getTotal(criteria);
	}
	
	@Override
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO) {
		
		return this.adminMemManagementMapper.adminMemDetail(adminMemVO);
	}

	@Override
	public int ckDelMem(AdminMemVO adminMemVO) {
		
		return this.adminMemManagementMapper.ckDelMem(adminMemVO);
	}

	
}
