package com.ipms.proj.gantt.service;

import java.util.List;

import com.ipms.proj.gantt.vo.GanttVO;

public interface GanttService {

	// 일감 조회
	public List<GanttVO> ganttSelect(String projId);		
	
}
