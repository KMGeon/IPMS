package com.ipms.main.admin.adminServiceCenter.adminNoticeInsert.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ipms.main.admin.adminServiceCenter.adminNoticeInsert.mapper.SvcNoticeInsertMapper;
import com.ipms.main.admin.adminServiceCenter.adminNoticeInsert.service.AdminNoticeInsertService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

@Service
@Transactional
public class AdminNoticeInsertServiceImpl implements AdminNoticeInsertService{
	
	@Autowired
	SvcNoticeInsertMapper svcNoticeInsertMapper;
	
	@Override
	public int insertSiteNotice(SvcNoticeVO svcNoticeVO) {
		return svcNoticeInsertMapper.insertSiteNotice(svcNoticeVO);
	}
}
