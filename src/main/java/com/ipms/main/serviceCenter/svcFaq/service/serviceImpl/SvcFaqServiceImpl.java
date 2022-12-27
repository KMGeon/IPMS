package com.ipms.main.serviceCenter.svcFaq.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.main.serviceCenter.svcFaq.mapper.SvcFaqMapper;
import com.ipms.main.serviceCenter.svcFaq.service.SvcFaqService;
import com.ipms.main.serviceCenter.svcNotice.vo.SvcNoticeVO;

@Service
public class SvcFaqServiceImpl implements SvcFaqService{
	@Autowired
	SvcFaqMapper svcFaqMapper;
	
	@Override
	public List<SvcNoticeVO> selectFaq(){
		return svcFaqMapper.selectFaq();
	}
}
