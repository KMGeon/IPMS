package com.ipms.main.admin.memManagement.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;

public interface AdminMemManagementService {

	public List<AdminMemVO> adminMemList(Criteria cri);
	
	public int getTotal();
	
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO);
}

