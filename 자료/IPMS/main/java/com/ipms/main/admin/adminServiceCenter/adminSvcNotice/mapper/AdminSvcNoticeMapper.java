package com.ipms.main.admin.adminServiceCenter.adminSvcNotice.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

public interface AdminSvcNoticeMapper {
	
	public List<SvcNoticeVO> selectNotice(Criteria criteria);
	
	public int total(Criteria criteria);
	
	public SvcNoticeVO SiteNoticeDetail(int siteNtNum);
	
	public int siteNoticeUpdate(SvcNoticeVO svcNoticeVO);
	
	public int siteNoticeDelete(SvcNoticeVO svcNoticeVO);
	
	public int siteNoticeDeleteList(List<SvcNoticeVO> svcNoticeVOList);
}
