package com.ipms.main.serviceCenter.svcNotice.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

public interface SvcNoticeMapper {
	
	public List<SvcNoticeVO> selectSvcNotice(Criteria criteria);
	
	public int total(Criteria criteria);
	
	public SvcNoticeVO SiteNoticeDetail(int siteNtNum);
}
