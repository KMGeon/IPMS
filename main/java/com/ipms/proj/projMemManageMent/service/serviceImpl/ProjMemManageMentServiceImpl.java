package com.ipms.proj.projMemManageMent.service.serviceImpl;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.mapper.MemManageMapper;
import com.ipms.proj.projMemManageMent.service.ProjMemManageMentService;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjMemManageMentServiceImpl implements ProjMemManageMentService {

    private final MemManageMapper memManageMapper;

    @Override
    public List<ProjVO> dropSupportPersonnel(ProjVO projVO) {
        return this.memManageMapper.dropSupportPersonnel(projVO);
    }


    @Override
    public List<ProjVO> projectPersonnelInquiry(ProjVO projVO) {
        return this.memManageMapper.projectPersonnelInquiry(projVO);
    }

    @Override
    public List<ProjVO> projectInvitationList(ProjVO projVO) {
        List<ProjVO> list = this.memManageMapper.projectInvitationList(projVO);
        list.remove(list.size() - 1);
        return list;
    }

    @Override
    public int sendInvitation(InvitationVO invitationVO) {
        return this.memManageMapper.sendInvitation(invitationVO);
    }

    @Override
    public List<InvitationVO> unapprovedInvitationList(String projId) {
        return this.memManageMapper.unapprovedInvitationList(projId);
    }


    @Override
    public int dropMemListProcessing(MemVO memVO) {
        return this.memManageMapper.dropMemListProcessing(memVO);
    }

    @Override
    public int extractionParticipants(ProjMemVO projMemVO) {
        return this.memManageMapper.extractionParticipants(projMemVO);
    }

    @Override
    public int insertAlrm(AlrmVO alrmVO) {
        return this.memManageMapper.insertAlrm(alrmVO);
    }

    @Override
    public int deleteAlrm(AlrmVO alrmVO) {
        return this.memManageMapper.deleteAlrm(alrmVO);
    }
}
