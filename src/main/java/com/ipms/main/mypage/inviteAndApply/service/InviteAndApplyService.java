package com.ipms.main.mypage.inviteAndApply.service;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;

import java.util.List;

public interface InviteAndApplyService {
    public List<ProjMemVO> memberWhoApplied(String memCode);

    public List<ProjMemVO> projectsApplied(String memCode);

    public String getMemCode(String memEmail);

    public int companionProject(ProjMemVO projMemVO);

    public int approval(ProjMemVO projMemVO);

    public int inviteAccept(ProjMemVO projMemVO);
    List<InvitationVO> invitationWaitingList(String memCode);


    int invitationApproved(ProjMemVO projMemVO);//초대 승인1

    int invitedMemberApproval(ProjMemVO projMemVO);//초대 승인2

    int refusalInvitation(InvitationVO invitationVO);//초대 거절

}
