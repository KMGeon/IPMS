package com.ipms.proj.calendar.service;

import java.util.List;

import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.task.vo.TaskVO;

public interface CalendarService {
	
	public List<CalendarVO> selectSchd(CalendarVO calendarVO);	// 개인 일정 리스트
	
	public List<TaskVO> selectT(CalendarVO calendarVO);	// 일감 리스트

	public List<TaskVO> selectT2(CalendarVO calendarVO);	// 일감 리스트
	
	public int insertSchd(CalendarVO calendarVO);	// 등록
	
	public int updateSchd(CalendarVO calendarVO);	// 수정
	
	public int deleteSchd(CalendarVO calendarVO);	// 삭제
	

}
