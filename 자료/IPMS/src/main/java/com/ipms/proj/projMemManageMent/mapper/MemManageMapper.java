package com.ipms.proj.projMemManageMent.mapper;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemManageMapper {
    List<ProjVO> dropSupportPersonnel(ProjVO projVO);

    List<ProjVO> projectPersonnelInquiry(ProjVO projVO);

    List<ProjVO> projectInvitationList(ProjVO projVO);

    int dropMemListProcessing(MemVO memVO);

    int sendInvitation(InvitationVO invitationVO);

    List<InvitationVO> unapprovedInvitationList(String projId);

    int extractionParticipants(ProjMemVO projMemVO);

    int insertAlrm(AlrmVO alrmVO);

    List<AlrmVO> getAlrmList(String memCode);

    int deleteAlrm(AlrmVO alrmVO);

    int countAlrm(String memCode);

}
