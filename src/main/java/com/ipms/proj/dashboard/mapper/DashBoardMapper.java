package com.ipms.proj.dashboard.mapper;

import java.util.List;
import java.util.Map;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.erd.vo.ErdVO;
import com.ipms.proj.freeboard.vo.FreeboardVO;
import com.ipms.proj.issue.vo.IssueVO;
import com.ipms.proj.noticeboard.vo.NoticeBoardVO;
import com.ipms.proj.task.vo.TaskVO;
import com.ipms.proj.wiki.vo.WikiVO;

public interface DashBoardMapper {
	
	public List<TaskVO> selectTask(Map<String, Object> map);
	
	public List<IssueVO> selectIssue(Map<String, Object> map);
	
	public List<NoticeBoardVO> selectProjNotice(Map<String, Object> map);
	
	public List<FreeboardVO> selectProjBoard(Map<String, Object> map);
	
	public List<ErdVO> selectErd(Map<String, Object> map);
	
	public List<WikiVO> selectWiki(Map<String, Object> map);
	
	public ProjVO selectProj(Map<String, Object> map);
	
	public Map<String, Object> selectPgres (Map<String, Object> map);
	
	public List<TaskVO> selectTaskList (Criteria criteria);
	
	public int total(Criteria criteria);
	
	public int selectTaskMiddle(String projId);
	public int selectTaskFinish(String projId);
	public int selectTaskAprove(String projId);
	public int selectTaskNot(String projId);
	
}
