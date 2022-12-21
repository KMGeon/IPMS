package com.ipms.main.admin.adminServiceCenter.adminSvcNotice.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.admin.adminServiceCenter.adminSvcNotice.mapper.AdminSvcNoticeMapper;
import com.ipms.main.admin.adminServiceCenter.adminSvcNotice.service.AdminSvcNoticeService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

@Service
public class AdminSvcNoticeServiceImpl implements AdminSvcNoticeService{
	
	@Autowired
	AdminSvcNoticeMapper adminSvcNoticeMapper;
	
	@Override
	public List<SvcNoticeVO> selectNotice(Criteria criteria){
		return adminSvcNoticeMapper.selectNotice(criteria);
	}
	
	@Override
	public int total() {
		return adminSvcNoticeMapper.total();
	}
	
	@Override
	public SvcNoticeVO SiteNoticeDetail(int siteNtNum) {
		return adminSvcNoticeMapper.SiteNoticeDetail(siteNtNum);
	}
}
