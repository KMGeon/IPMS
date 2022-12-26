package com.ipms.main.mypage.inviteAndApply.service.serviceImpl;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Slf4j
@Service
public class InviteAndApplyServiceImpl implements InviteAndApplyService {
    @Autowired
    MyPageMapper myPageMapper;
    @Autowired
    ProjMapper projMapper;
    @Autowired
    InviteAndApplyService inviteAndApplyService;

    @Transactional
    public String inviteOrApply(Model model, Authentication authentication, ProjMemVO projMemVO) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjMemVO> memberWhoApplied = this.inviteAndApplyService.memberWhoApplied(this.myPageMapper.getMemCode(userDetails.getUsername()));
        List<ProjMemVO> projectsApplied = this.inviteAndApplyService.projectsApplied(this.myPageMapper.getMemCode(userDetails.getUsername()));
        List<ProjMemVO>invitationWaitingList = this.inviteAndApplyService.invitationWaitingList(this.myPageMapper.getMemCode(userDetails.getUsername()));
        model.addAttribute("memberWhoApplied", memberWhoApplied);
        model.addAttribute("projectsApplied", projectsApplied);
        model.addAttribute("invitationWaitingList",invitationWaitingList);
        return "main/mypage/inviteAndApply";
    }

    @Override
    public List<ProjMemVO> invitationWaitingList(String memCode) {
        return this.myPageMapper.invitationWaitingList(memCode);
    }

    @Override
    public int acceptInvitation(ProjMemVO projMemVO) {
        return this.myPageMapper.acceptInvitation(projMemVO);
    }

    @Override
    public int refusalInvitation(ProjMemVO projMemVO) {
        return this.myPageMapper.refusalInvitation(projMemVO);
    }


    @Transactional
    public int approval(ProjMemVO projMemVO) {
        if (this.myPageMapper.approvalJoiningProject(projMemVO) == 1) {
            MemberAuth memberAuth = new MemberAuth();
            memberAuth.setMemCode(projMemVO.getMemCode());
            memberAuth.setProjId(projMemVO.getProjId());
            memberAuth.setMemAuth("ROLE_PROJECT");
            this.projMapper.projAuthInsert(memberAuth);
            return 1;
        }
        return 0;
    }

    @Override
    public List<ProjMemVO> memberWhoApplied(String memCode) {
        return this.myPageMapper.memberWhoApplied(memCode);
    }

    @Override
    public List<ProjMemVO> projectsApplied(String memCode) {
        return this.myPageMapper.projectsApplied(memCode);
    }

    @Override
    public String getMemCode(String memEmail) {
        return this.myPageMapper.getMemCode(memEmail);
    }

    @Override
    public int approvalJoiningProject(ProjMemVO projMemVO) {
        return this.myPageMapper.approvalJoiningProject(projMemVO);
    }


    @Override
    public int companionProject(ProjMemVO projMemVO) {
        return this.myPageMapper.companionProject(projMemVO);
    }
}