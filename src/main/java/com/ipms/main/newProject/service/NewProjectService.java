package com.ipms.main.newProject.service;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;


public interface NewProjectService {
    public int projInsert(ProjVO projVO);
    public int insertProjMem(ProjMemVO projMemVO);
}
