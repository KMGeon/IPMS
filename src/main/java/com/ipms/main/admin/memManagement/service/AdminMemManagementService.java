package com.ipms.main.admin.memManagement.service;

import java.util.List;

import com.ipms.main.admin.memManagement.vo.AdminMemVO;

public interface AdminMemManagementService {

	public List<AdminMemVO> adminMemList();
	
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO);
}

