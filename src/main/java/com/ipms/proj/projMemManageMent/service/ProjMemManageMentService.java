package com.ipms.proj.projMemManageMent.service;

import com.ipms.main.newProject.vo.ProjVO;

import java.util.List;

public interface ProjMemManageMentService {
    List<ProjVO> dropSupportPersonnel (ProjVO projVO);
    List<ProjVO>projectPersonnelInquiry(ProjVO projVO);
    List<ProjVO>projectInvitationList(ProjVO projVO);
//    public List<MemVO> dropApplicationList(MemVO memVO);
//
//    public int dropMemListProcessing(MemVO memVO);
//
//    public List<MemVO> listPeopleDisembarked(MemVO memVO);
//
//    public int deleteAuthority(MemVO memVO);
//    public List<MemVO> projectInvitationList(MemVO memVO);
////    public String projmemManagement(@PathVariable(name = "projId") String projId, Authentication authentication, Model model);
//public int invitationRequestButton(ProjVO projVO);
}
