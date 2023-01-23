package com.ipms.proj.projMemManageMent.service;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;

import java.util.List;

public interface ProjMemManageMentService {
    List<ProjVO> dropSupportPersonnel(ProjVO projVO);

    List<ProjVO> projectPersonnelInquiry(ProjVO projVO);

    List<ProjVO> projectInvitationList(ProjVO projVO);

    int sendInvitation(InvitationVO invitationVO);

    List<InvitationVO>unapprovedInvitationList(String projId );

    int dropMemListProcessing(MemVO memVO);//하차 승인
    int extractionParticipants(ProjMemVO projMemVO);
    int insertAlrm(AlrmVO alrmVO);
    int deleteAlrm(AlrmVO alrmVO);

}
