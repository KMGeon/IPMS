package com.ipms.main.admin.memManagement.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.memManagement.vo.AdminMemVO;
import com.ipms.main.admin.projManagement.vo.ProjManaVO;

public interface AdminMemManagementService {

	public List<AdminMemVO> adminMemList(Criteria cri);
	
	public int getTotal(Criteria criteria);
	
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO);
	
	public int ckDelMem(AdminMemVO adminMemVO);
}

