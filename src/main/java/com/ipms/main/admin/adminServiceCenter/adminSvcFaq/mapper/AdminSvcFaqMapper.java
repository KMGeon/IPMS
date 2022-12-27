package com.ipms.main.admin.adminServiceCenter.adminSvcFaq.mapper;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

public interface AdminSvcFaqMapper {
	
	public List<SvcNoticeVO> selectFaq(Criteria criteria);
	
	public int total(Criteria criteria);
}
