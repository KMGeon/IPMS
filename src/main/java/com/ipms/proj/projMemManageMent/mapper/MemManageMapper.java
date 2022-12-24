package com.ipms.proj.projMemManageMent.mapper;

import com.ipms.main.newProject.vo.ProjVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemManageMapper {
    List<ProjVO> dropSupportPersonnel (ProjVO projVO);
    List<ProjVO>projectPersonnelInquiry(ProjVO projVO);
    List<ProjVO>projectInvitationList(ProjVO projVO);
//    public List<MemVO>dropApplicationList(MemVO memVO);
//    public int dropMemListProcessing(MemVO memVO);
//    public List<MemVO>listPeopleDisembarked(MemVO memVO);
//    public int deleteAuthority(MemVO memVO);
//    public List<MemVO> projectInvitationList(MemVO memVO);
//    public int invitationRequestButton(ProjVO projVO);
}
