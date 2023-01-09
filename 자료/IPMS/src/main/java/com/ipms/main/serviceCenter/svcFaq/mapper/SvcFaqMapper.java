package com.ipms.main.serviceCenter.svcFaq.mapper;

import java.util.List;

import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

public interface SvcFaqMapper {
	
	public List<SvcNoticeVO> selectFaq();
}
