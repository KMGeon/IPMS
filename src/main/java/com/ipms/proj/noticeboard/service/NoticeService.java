package com.ipms.proj.noticeboard.service;

import java.util.List;

import com.ipms.commons.vo.Criteria;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;

public interface NoticeService {
	
	public List<NoticeBoardVO> getNtPage(Criteria cri);
	
	public int getTotal();
	
	public NoticeBoardVO detailNt(NoticeBoardVO noticeBoardVO);
	
	public int insertNt(NoticeBoardVO noticeBoardVO);
	
	public int updateNt(NoticeBoardVO noticeBoardVO);
	
	public int deleteNt(NoticeBoardVO noticeBoardVO);
	
	public int ckDelNt(NoticeBoardVO noticeBoardVO);

}
