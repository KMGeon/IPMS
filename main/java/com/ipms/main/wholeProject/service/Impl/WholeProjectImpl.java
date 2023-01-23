package com.ipms.main.wholeProject.service.Impl;

import com.ipms.commons.vo.Criteria;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class WholeProjectImpl implements WholeProjectService {

    private final ProjMapper projMapper;
    private final MyPageMapper myPageMapper;

    @Transactional
    public int joinProjectProcess(ProjVO projVO, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String memCode = myPageMapper.getMemCode(userDetails.getUsername());
        ProjVO vo = new ProjVO();
        vo.setMemCode(memCode);
        vo.setProjId(projVO.getProjId());
        return this.joinProject(vo);
    }

    @Override
    public int joinProject(ProjVO projVO) {
        return this.projMapper.joinProject(projVO);
    }


    @Override
    public int getWholeProjectTotal(Criteria criteria) {
        return this.projMapper.getWholeProjectTotal(criteria);
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
    public List<ProjVO> detailPage(String projId) {
        return this.projMapper.detailPage(projId);
    }


    @Override
    public List<ProjVO> checkMyProject(String projId) {
        return this.projMapper.checkMyProject(projId);
    }


}
