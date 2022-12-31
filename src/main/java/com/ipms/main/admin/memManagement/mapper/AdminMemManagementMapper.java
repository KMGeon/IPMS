package com.ipms.main.admin.memManagement.mapper;

import java.util.List;

import com.ipms.main.admin.memManagement.vo.AdminMemVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

public interface AdminMemManagementMapper {

	public List<AdminMemVO> adminMemList(); // 회원 리스트
	
	public AdminMemVO adminMemDetail(AdminMemVO adminMemVO); // 회원 상세 
}
