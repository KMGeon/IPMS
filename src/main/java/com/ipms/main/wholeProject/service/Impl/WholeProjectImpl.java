package com.ipms.main.wholeProject.service.Impl;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Service
public class WholeProjectImpl implements WholeProjectService {
    @Autowired
    ProjMapper projMapper;
    @Inject
    WholeProjectService wholeProjectService;
@Autowired
    MyPageMapper myPageMapper;
    @Transactional
    public String goToProjectDetails(String projId, Model model, Authentication authentication, HttpServletResponse response) throws IOException {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjVO> projVOList = this.wholeProjectService.getProjId(userDetails.getUsername());
        for (ProjVO proj : projVOList) {
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
    public int joinProjectProcess(ProjVO projVO, Authentication authentication){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String memCode = myPageMapper.getMemCode(userDetails.getUsername());
        ProjVO vo = new ProjVO();
        vo.setMemCode(memCode);
        vo.setProjId(projVO.getProjId());
        List<ProjVO> list = this.wholeProjectService.checkMyProject2(vo);
        return this.wholeProjectService.joinProject(vo);
    }


    @Override
    public int joinProject(ProjVO projVO) {
        return this.projMapper.joinProject(projVO);
    }


    @Override
    public List<ProjMemVO> listProj() {
        return this.projMapper.listProj();
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


    @Override
    public List<ProjVO> checkMyProject(String projId) {
        return this.projMapper.checkMyProject(projId);
    }

    @Override
    public List<ProjVO> checkMyProject2(ProjVO projVO) {
        return this.projMapper.checkMyProject2(projVO);
    }

}
