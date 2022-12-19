package com.ipms.main.wholeProject.service;

import com.ipms.main.newProject.vo.ProjVO;

import java.util.List;
import java.util.Map;

public interface WholeProjectService {
    public List<ProjVO> listProj();
    public List<ProjVO> selectPage(Map map);
    public List<ProjVO>getProjId(String memEmail);
    public int count();
    public List<ProjVO> detailPage(String projId);
}
