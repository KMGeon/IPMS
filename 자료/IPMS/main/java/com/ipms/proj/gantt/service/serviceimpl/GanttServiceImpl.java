package com.ipms.proj.gantt.service.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.gantt.mapper.GanttMapper;
import com.ipms.proj.gantt.service.GanttService;
import com.ipms.proj.gantt.vo.GanttVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GanttServiceImpl implements GanttService{
	
	@Autowired
	GanttMapper ganttMapper;

	@Override
	public List<GanttVO> ganttSelect(String projId) {
		
		List<GanttVO> ganttTaskList = ganttMapper.ganttSelect(projId);
		
		for(GanttVO ganttVO : ganttTaskList) {
			double original = ganttVO.getTaskPgres();
			double divide = 100;
			double pgres = original/divide;
			
			ganttVO.setTaskPgres(pgres);
			
//			log.info("GanttServiceImpl - ganttSelect -> ganttVO.getTaskPgres() : {}", ganttVO.getTaskPgres());
//			log.info("GanttServiceImpl - ganttSelect -> temp2 : {}", temp2);
		}
		
		return ganttTaskList;
	}
	
	
}
