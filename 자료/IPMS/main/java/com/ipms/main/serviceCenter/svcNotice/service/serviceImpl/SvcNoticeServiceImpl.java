package com.ipms.main.serviceCenter.svcNotice.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcNotice.mapper.SvcNoticeMapper;
import com.ipms.main.serviceCenter.svcNotice.service.SvcNoticeService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SvcNoticeServiceImpl implements SvcNoticeService{
	
	@Autowired
	SvcNoticeMapper svcNoticeMapper;
	
	@Override
	public List<SvcNoticeVO> selectSvcNotice(Criteria criteria){
		return svcNoticeMapper.selectSvcNotice(criteria);
	}

	@Override
	public int total(Criteria criteria) {
		return svcNoticeMapper.total(criteria);
	}

	@Override
	public SvcNoticeVO SiteNoticeDetail(int siteNtNum) {
		// TODO Auto-generated method stub
		return svcNoticeMapper.SiteNoticeDetail(siteNtNum);
	}
}
