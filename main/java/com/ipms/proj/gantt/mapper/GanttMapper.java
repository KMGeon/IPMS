package com.ipms.proj.gantt.mapper;

import java.util.List;

import com.ipms.proj.gantt.vo.GanttVO;

public interface GanttMapper {
	
	// 일감 조회
	public List<GanttVO> ganttSelect(String projId);		
	
}
