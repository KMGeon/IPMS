package com.ipms.main.admin.adminServiceCenter.adminSvcQaA.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.mapper.AdminSvcQaAMapper;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.service.AdminSvcQaAService;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaACommentVO;
import com.ipms.main.admin.adminServiceCenter.adminSvcQaA.vo.AdminSvcQaAVO;
import com.ipms.main.serviceCenter.svcQaA.vo.SvcQaAVO;

@Transactional(readOnly = true)
@Service
public class AdminSvcQaAServiceImpl implements AdminSvcQaAService{
	
	@Autowired
	AdminSvcQaAMapper adminSvcQaAMapper;
	
	@Override
	public List<AdminSvcQaAVO> adminSvcQaASelect(Criteria criteria) {
		
		List<AdminSvcQaAVO> adminSvcQaASelect = adminSvcQaAMapper.adminSvcQaASelect(criteria);
		
		return adminSvcQaASelect;
	}

	@Override
	public int adminTotal() {
		
		return adminSvcQaAMapper.adminTotal();
		
	}

	@Override
	public AdminSvcQaAVO adminSvcQaADetail(String qnaNum) {
		
		return adminSvcQaAMapper.adminSvcQaADetail(qnaNum);
		
	}

	@Override
	public int adminSvcQaACommentInsert(AdminSvcQaACommentVO adminSvcQaACommentVO) {
		
		return adminSvcQaAMapper.adminSvcQaACommentInsert(adminSvcQaACommentVO);
		
	}

	@Override
	public AdminSvcQaACommentVO adminSvcQaACommentSelect(String qnaNum) {
		
		return adminSvcQaAMapper.adminSvcQaACommentSelect(qnaNum);
	
	}

	@Override
	public int adminSvcQaAStatusUpdate(int qnaNum) {
		
		return adminSvcQaAMapper.adminSvcQaAStatusUpdate(qnaNum);
		
	}

}
