package com.ipms.main.newProject.service;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;


public interface NewProjectService {

    public int projInsert(ProjVO projVO);

    public int insertProjMem(ProjMemVO projMemVO);

    public int projAuthInsert(MemberAuth memberAuth);

    public String projectCreate(ProjVO projVO, MemVO memVO, ProjTeamVO projTeamVO, String teamId, String memCode);
}
