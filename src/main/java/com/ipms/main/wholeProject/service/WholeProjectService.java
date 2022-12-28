package com.ipms.main.wholeProject.service;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface WholeProjectService {
    public  List<ProjMemVO>listProj();
    public List<ProjVO>getListPage( );
    public int getWholeProjectTotal();
    public List<ProjVO>getListPage(Criteria criteria);
    public List<ProjVO>getProjId(String memEmail);
    public List<ProjVO> detailPage(String projId);
    public int joinProject(ProjVO projVO);
    //
    public List<ProjVO>checkMyProject(String projId);
    public List<ProjVO> checkMyProject2(ProjVO projVO);
    public int joinProjectProcess(ProjVO projVO, Authentication authentication);
}
