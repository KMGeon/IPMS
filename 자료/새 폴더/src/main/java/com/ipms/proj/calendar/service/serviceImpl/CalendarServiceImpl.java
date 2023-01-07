package com.ipms.proj.calendar.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.calendar.mapper.CalendarMapper;
import com.ipms.proj.calendar.service.CalendarService;
import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.task.vo.TaskVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarMapper calendarMapper;
	
	// 일정 리스트
	@Override
	public List<CalendarVO> selectSchd(CalendarVO calendarVO) {
		
		return this.calendarMapper.selectSchd(calendarVO);
	}

	// 일정 등록
	@Override
	public int insertSchd(CalendarVO calendarVO) {
		
		return this.calendarMapper.insertSchd(calendarVO);
	}

	// 일정 삭제
	@Override
	public int deleteSchd(CalendarVO calendarVO) {
		
		return this.calendarMapper.deleteSchd(calendarVO);
	}

	@Override
	public int updateSchd(CalendarVO calendarVO) {
		
		return this.calendarMapper.updateSchd(calendarVO);
	}

	@Override
	public List<TaskVO> selectT(CalendarVO calendarVO) {
		
		return this.calendarMapper.selectT(calendarVO);
	}

	@Override
	public List<TaskVO> selectT2(CalendarVO calendarVO) {
		
		return this.calendarMapper.selectT2(calendarVO);
	}

}
