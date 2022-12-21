package com.ipms.main.admin.adminServiceCenter.adminSvcNotice.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

public interface AdminSvcNoticeService {

	public List<SvcNoticeVO> selectNotice(Criteria criteria);

	public int total();

	public SvcNoticeVO SiteNoticeDetail(int siteNtNum);

}
