package com.ipms.main.mypage.inviteAndApply.service;

import com.ipms.main.newProject.vo.ProjMemVO;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;

import java.util.List;

public interface InviteAndApplyService {
    public List<ProjMemVO> memberWhoApplied(String memCode);

    public List<ProjMemVO> projectsApplied(String memCode);

    public String getMemCode(String memEmail);

    public int approvalJoiningProject(ProjMemVO projMemVO);

    public int companionProject(ProjMemVO projMemVO);

    public int approval(ProjMemVO projMemVO);

    public String inviteOrApply(Model model, Authentication authentication, ProjMemVO projMemVO) ;

    List<ProjMemVO> invitationWaitingList(String memCode);

    int acceptInvitation(ProjMemVO projMemVO);
    int refusalInvitation(ProjMemVO projMemVO);
    int acceptInviteAndDelete(ProjMemVO projMemVO);
    public int acceptInvitationProcess(ProjMemVO projMemVO);
}
