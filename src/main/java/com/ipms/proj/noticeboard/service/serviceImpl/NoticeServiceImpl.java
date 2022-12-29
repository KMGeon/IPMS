package com.ipms.proj.noticeboard.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.noticeboard.mapper.NoticeBoardMapper;
import com.ipms.proj.noticeboard.service.NoticeService;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeBoardMapper noticeBoardMapper;
	
	@Override
	public List<NoticeBoardVO> getNtPage(Criteria cri) {
		
		return this.noticeBoardMapper.getNtPage(cri);
	}

	@Override
	public int getTotal(String projId) {
		
		return this.noticeBoardMapper.getTotal(projId);
	}

	@Override
	public NoticeBoardVO detailNt(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.detailNt(noticeBoardVO);
	}

	@Override
	public int insertNt(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.insertNt(noticeBoardVO);
	}

	@Override
	public int deleteNt(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.deleteNt(noticeBoardVO);
	}

	@Override
	public int updateNt(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.updateNt(noticeBoardVO);
	}

	@Override
	public int ckDelNt(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.ckDelNt(noticeBoardVO);
	}

	//INTG_ATTACH_FILE 테이블의 MAX(INTG_ATTACH_FILE_NUM)+1 컬럼 값 가져오기
	@Override
	public int getIntgAttachFileNum() {
		return this.noticeBoardMapper.getIntgAttachFileNum();
	}
	
	@Override
	public int insertFile(List<IntgAttachFileVO> intgAttachFileVOList) {
		
		return this.noticeBoardMapper.insertFile(intgAttachFileVOList);
	}

	@Override
	public String[] authCheck(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.authCheck(noticeBoardVO);
	}

	@Override
	public NoticeBoardVO detailNt2(NoticeBoardVO noticeBoardVO) {
		
		return this.noticeBoardMapper.detailNt2(noticeBoardVO);
	}
	
}
