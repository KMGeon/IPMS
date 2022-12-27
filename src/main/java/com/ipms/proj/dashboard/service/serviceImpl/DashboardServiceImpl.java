package com.ipms.proj.dashboard.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipms.proj.dashboard.mapper.DashBoardMapper;
import com.ipms.proj.dashboard.service.DashboardService;
import com.ipms.proj.erd.vo.ErdVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.vo.IssueVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.proj.wiki.vo.WikiVO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	DashBoardMapper dashBoardMapper;
	
	@Override
	public List<TaskVO> selectTask(Map<String, Object> map){
		return dashBoardMapper.selectTask(map);
	}
	@Override
	public List<IssueVO> selectIssue(Map<String, Object> map){
		return dashBoardMapper.selectIssue(map);
	}
	@Override
	public List<NoticeBoardVO> selectProjNotice(Map<String, Object> map){
		return dashBoardMapper.selectProjNotice(map);
	}
	@Override
	public List<FreeboardVO> selectProjBoard(Map<String, Object> map){
		return dashBoardMapper.selectProjBoard(map);
	}
	
	@Override
	public List<ErdVO> selectErd(Map<String, Object> map){
		return dashBoardMapper.selectErd(map);
	}
	
	@Override
	public List<WikiVO> selectWiki(Map<String, Object> map){
		return dashBoardMapper.selectWiki(map);
	}
}
