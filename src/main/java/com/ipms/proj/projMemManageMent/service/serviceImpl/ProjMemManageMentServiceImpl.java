package com.ipms.proj.projMemManageMent.service.serviceImpl;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.mapper.MemManageMapper;
import com.ipms.proj.projMemManageMent.service.ProjMemManageMentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjMemManageMentServiceImpl implements ProjMemManageMentService {
    @Autowired
    MemManageMapper memManageMapper;
    @Autowired
    ProjMemManageMentService projMemManageMentService;
    @Autowired
    MyPageMapper myPageMapper;

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
        return this.memManageMapper.projectInvitationList(projVO);
    }

//    @Transactional
//    public String projmemManagement(@PathVariable(name = "projId") String projId, Authentication authentication, Model model) {
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        userDetails.getUsername();
//        MemVO vo = new MemVO();
//        vo.setProjId(projId);
//        vo.setMemCode(this.myPageMapper.getMemCode(userDetails.getUsername()));
//        List<MemVO> list = this.projMemManageMentService.dropApplicationList(vo);
//        List<MemVO> delMemList = this.projMemManageMentService.listPeopleDisembarked(vo);
//        List<MemVO>inviteList = this.projMemManageMentService.projectInvitationList( this.myPageMapper.getMemCode(userDetails.getUsername()));
//        model.addAttribute("list", list);
//        model.addAttribute("delMemList", delMemList);
//        model.addAttribute("inviteList", inviteList);
//        return "proj/memmanagement/projMemberManagement";
//    }



}
