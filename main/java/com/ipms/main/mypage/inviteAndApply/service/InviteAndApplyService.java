package com.ipms.main.mypage.inviteAndApply.service;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;

import java.util.List;

public interface InviteAndApplyService {
    List<ProjMemVO> memberWhoApplied(String memCode);

    List<ProjMemVO> projectsApplied(String memCode);

    String getMemCode(String memEmail);

    int companionProject(ProjMemVO projMemVO);

    int approval(ProjMemVO projMemVO);

    int inviteAccept(ProjMemVO projMemVO);

    List<InvitationVO> invitationWaitingList(String memCode);

    int invitedMemberApproval(ProjMemVO projMemVO);//초대 승인

    int refusalInvitation(InvitationVO invitationVO);//초대 거절

}
