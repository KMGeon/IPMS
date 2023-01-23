package com.ipms.main.mypage.mapper;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {
    List<ProjMemVO> memberWhoApplied(String memCode);

    List<ProjMemVO> projectsApplied(String memCode);

    String getMemCode(String memEmail);

    public int approvalJoiningProject(ProjMemVO projMemVO);

    public int companionProject(ProjMemVO projMemVO);

    public List<ProjMemVO> goingProjects(String memCode);

    List<ProjVO> getCheckProjId(String memEmail);

    List<InvitationVO> invitationWaitingList(String memCode);//초대된 프로젝트

    int invitationApproved(ProjMemVO projMemVO);//초대 승인1

    int invitedMemberApproval(ProjMemVO projMemVO);//초대 승인2

    int refusalInvitation(InvitationVO invitationVO);//초대 거절

}
