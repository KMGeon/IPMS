package com.ipms.proj.calendar.mapper;

import java.util.List;import org.apache.tiles.definition.dao.CachingLocaleUrlDefinitionDAO;

import com.ipms.proj.calendar.vo.CalendarVO;
import com.ipms.proj.task.vo.TaskVO;

public interface CalendarMapper {

	public List<CalendarVO> selectSchd(CalendarVO calendarVO); // 리스트 뽑기
	
	public List<TaskVO> selectT(CalendarVO calendarVO);	// 내 일감 리스트 뽑기
	
	public List<TaskVO> selectT2(CalendarVO calendarVO);	// 모든 상위 일감
	
	public int insertSchd(CalendarVO calendarVO);	// 일정 등록
	
	public int updateSchd(CalendarVO calendarVO); // 일정 수정
	
	public int deleteSchd(CalendarVO calendarVO); // 일정 삭제
}
