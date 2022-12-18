package com.ipms.main.wholeProject.service;

import com.ipms.main.newProject.vo.ProjVO;

import java.util.List;

public interface WholeProjectService {
    public List<ProjVO> listProj();
    public List<ProjVO> detailPage(String projId);
}
