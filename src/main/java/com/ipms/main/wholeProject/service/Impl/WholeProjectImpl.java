package com.ipms.main.wholeProject.service.Impl;

import com.ipms.commons.pageHandler.Criteria;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class WholeProjectImpl implements WholeProjectService {
    @Autowired
    ProjMapper projMapper;
    @Inject
    WholeProjectService wholeProjectService;

    @Transactional
    public String goToProjectDetails(String projId, Model model, Authentication authentication, HttpServletResponse response) throws IOException {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjVO> test = this.wholeProjectService.getProjId(userDetails.getUsername());
        for (ProjVO proj : test) {
            if (proj.getProjId().equals(projId)) {
                List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);
                model.addAttribute("detailList", detailList);
                return "main/wholeProject/projectDetail";
            }
        }
        response.sendRedirect("/main/page");
        return "main/page";
    }

    @Transactional
    public int registrationApplication(ProjMemVO projMemVO) {
        String processed = this.projMapper.registrationStatus(projMemVO);
        if (processed.equals(projMemVO.getMemCode())) {
            return 0;
        }
        joinProject(projMemVO);
        return 1;
    }

    @Override
    public int joinProject(ProjMemVO projMemVO) {
        return this.projMapper.joinProject(projMemVO);
    }

    @Override
    public String registrationStatus(ProjMemVO projMemVO) {
        return this.projMapper.registrationStatus(projMemVO);
    }


    @Override
    public List<ProjVO> listProj() {
        return this.projMapper.listProj();
    }

    @Override
    public List<ProjVO> getListPage(Criteria criteria) {
        return this.projMapper.getListPage(criteria);
    }


    @Override
    public List<ProjVO> getProjId(String memEmail) {
        return this.projMapper.getProjId(memEmail);
    }

    @Override
    public int count() {
        return this.projMapper.count();
    }

    @Override
    public List<ProjVO> detailPage(String projId) {
        return this.projMapper.detailPage(projId);
    }
}
