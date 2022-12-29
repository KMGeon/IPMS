package com.ipms.proj.noticeboard.mapper;

import java.util.List;

import com.ipms.commons.ftp.vo.IntgAttachFileVO;
import com.ipms.commons.vo.Criteria;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;

public interface NoticeBoardMapper {

	public List<NoticeBoardVO> getNtPage(Criteria cri); // 리스트
	
	public int getTotal(String projId); // 게시글 총 개수 
	
	public NoticeBoardVO detailNt(NoticeBoardVO noticeBoardVO); // 게시판 상세 
	
	public int insertNt(NoticeBoardVO noticeBoardVO); // 공지 등록
	
	public int updateNt(NoticeBoardVO noticeBoardVO); // 공지 수정

	public int deleteNt(NoticeBoardVO noticeBoardVO); // 공지 삭제
	
	public int ckDelNt(NoticeBoardVO noticeBoardVO); // 체크박스 선택 삭제
	
	//INTG_ATTACH_FILE 테이블의 MAX(INTG_ATTACH_FILE_NUM)+1 컬럼 값 가져오기
	public int getIntgAttachFileNum(); 
	
	public int insertFile(List<IntgAttachFileVO> intgAttachFileVOList); // 첨부파일 추가
	
	public String[] authCheck(NoticeBoardVO noticeBoardVO); // 리더 체크
	
	public NoticeBoardVO detailNt2(NoticeBoardVO noticeBoardVO);
	
}
