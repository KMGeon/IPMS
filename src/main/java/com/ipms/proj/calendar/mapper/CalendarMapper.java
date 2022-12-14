package com.ipms.proj.calendar.mapper;

import java.util.List;

import com.ipms.proj.calendar.vo.CalendarVO;

public interface CalendarMapper {

	public List<CalendarVO> selectSchd(); // 리스트 뽑기
	
	public int insertSchd(CalendarVO calendarVO);	// 일정 등록
	
	// 일정 수정
	
	public int deleteSchd(CalendarVO calendarVO); // 일정 삭제
}
