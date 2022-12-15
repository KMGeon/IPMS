package com.ipms.main.newProject.service;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;

import java.util.List;


public interface NewProjectService {

    public int projInsert(ProjVO projVO);

    public int insertProjMem(ProjMemVO projMemVO);

    public int projAuthInsert(MemberAuth memberAuth);

    public int authDelete(String memCoed);

    public int insertProTeam(ProjTeamVO projTeamVO);
}
