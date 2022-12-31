package com.ipms.main.admin.memManagement.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.main.admin.memManagement.mapper.AdminMemManagementMapper;
import com.ipms.main.admin.memManagement.service.AdminMemManagementService;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;

@Service
public class AdminMemManagementImpl implements AdminMemManagementService {

	@Autowired
	AdminMemManagementMapper adminMemManagementMapper;
	
	@Override
	public List<AdminMemVO> adminMemList() {
		
		return this.adminMemManagementMapper.adminMemList();
	}

	@Override
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO) {
		
		return this.adminMemManagementMapper.adminMemDetail(adminMemVO);
	}

	
}
