package com.ipms.main.projectlistdetail.service;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.projectlistdetail.vo.ProjSmryCmtVO;

import java.util.List;

public interface ProjectListDetailService {
	
	List<ProjSmryCmtVO> projCmtList(String projId);
	
	public int projCmtInsert(ProjSmryCmtVO projSmryCmtVO);
    
    public int joinProject(ProjVO projVO);
    ProjSmryCmtVO read(String projSmryCmtNum);
    public List<MemVO>getDetailLeaderInfo(String memCode);
    public int projectsAlreadyApplied(ProjVO projVO);
}
