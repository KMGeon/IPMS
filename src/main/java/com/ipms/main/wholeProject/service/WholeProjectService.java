package com.ipms.main.wholeProject.service;

import com.ipms.commons.pageHandler.Criteria;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface WholeProjectService {
    public  List<ProjMemVO>listProj();
    public List<ProjVO>getListPage(Criteria criteria);
    public List<ProjVO>getProjId(String memEmail);
    public int count();
    public List<ProjVO> detailPage(String projId);
    public String goToProjectDetails(String projId , Model model, Authentication authentication , HttpServletResponse response) throws IOException ;
    public int joinProject(ProjMemVO projMemVO);
    public String registrationStatus(ProjMemVO projMemVO);
    public int registrationApplication(ProjMemVO projMemVO) ;
}
