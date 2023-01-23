package com.ipms.main.mypage.inviteAndApply.service.serviceImpl;

import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.mapper.ProjMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class InviteAndApplyServiceImpl implements InviteAndApplyService {

    private final MyPageMapper myPageMapper;

    private final ProjMapper projMapper;


    @Transactional
    public int approval(ProjMemVO projMemVO) {
        if (this.myPageMapper.approvalJoiningProject(projMemVO) == 1) {
            getProjectAuth(projMemVO);
            return 1;
        }
        return 0;
    }

    @Transactional
    public int inviteAccept(ProjMemVO projMemVO) {
        if (this.myPageMapper.invitationApproved(projMemVO) == 1) {
            if (this.invitedMemberApproval(projMemVO) == 1) {
                getProjectAuth(projMemVO);
                return 1;
            }
        }
        return 0;
    }

    private void getProjectAuth(ProjMemVO projMemVO) {//Role_project 권한 생성
        MemberAuth memberAuth = new MemberAuth();
        memberAuth.setMemCode(projMemVO.getMemCode());
        memberAuth.setProjId(projMemVO.getProjId());
        memberAuth.setMemAuth("ROLE_PROJECT");
        this.projMapper.projAuthInsert(memberAuth);
    }

    @Override
    public List<InvitationVO> invitationWaitingList(String memCode) {
        return this.myPageMapper.invitationWaitingList(memCode);
    }


    @Override
    public int invitedMemberApproval(ProjMemVO projMemVO) {
        return this.myPageMapper.invitedMemberApproval(projMemVO);
    }

    @Override
    public int refusalInvitation(InvitationVO invitationVO) {
        return this.myPageMapper.refusalInvitation(invitationVO);
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
    public int companionProject(ProjMemVO projMemVO) {
        return this.myPageMapper.companionProject(projMemVO);
    }
}