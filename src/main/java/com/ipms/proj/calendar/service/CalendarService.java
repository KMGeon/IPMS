package com.ipms.proj.calendar.service;

import java.util.List;

import com.ipms.proj.calendar.vo.CalendarVO;

public interface CalendarService {
	
	public List<CalendarVO> selectSchd();	// 리스트
	
	public int insertSchd(CalendarVO calendarVO);	// 등록
	
	public int updateSchd(CalendarVO calendarVO);	// 수정
	
	public int deleteSchd(CalendarVO calendarVO);	// 삭제

}
