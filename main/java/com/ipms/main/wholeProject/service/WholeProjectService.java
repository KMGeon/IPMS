package com.ipms.main.wholeProject.service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface WholeProjectService {
    public int getWholeProjectTotal();

    public int getWholeProjectTotal(Criteria criteria);
    public List<ProjVO>getListPage(Criteria criteria);
    public List<ProjVO>getProjId(String memEmail);
    public List<ProjVO> detailPage(String projId);
    public int joinProject(ProjVO projVO);
    public List<ProjVO>checkMyProject(String projId);
    public int joinProjectProcess(ProjVO projVO, Authentication authentication);
}
