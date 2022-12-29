package com.ipms.proj.projMemManageMent.controller;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.service.ProjMemManageMentService;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequestMapping("/proj")
public class ProjMemManagementController {
    @Autowired
    ProjMemManageMentService projMemManageMentService;
    @Autowired
    MyPageMapper myPageMapper;


    @GetMapping("/{projId}/memManagement")
    public String projmemManagement(@PathVariable(name = "projId") String projId, Authentication authentication, Model model) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        userDetails.getUsername();
        ProjVO vo = new ProjVO();
        vo.setProjId(projId);
        vo.setMemCode(this.myPageMapper.getMemCode(userDetails.getUsername()));
        model.addAttribute("dropMemList",this.projMemManageMentService.dropSupportPersonnel(vo));
        model.addAttribute("ProjectParticipantsMem",this.projMemManageMentService.projectPersonnelInquiry(vo));
        model.addAttribute("projectInvitationList",this.projMemManageMentService.projectInvitationList(vo));
        model.addAttribute("unapprovedInvitationList", this.projMemManageMentService.unapprovedInvitationList(projId));//미승인 초대 리스트
        return "proj/memmanagement/projMemberManagement";
    }

    @RequestMapping(value = "/dropMemListProcessing", method = RequestMethod.POST)
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    public int dropMemListProcessing(MemVO memVO) {
        return this.projMemManageMentService.dropMemListProcessing(memVO);
    }

    @ResponseBody
    @RequestMapping(value = "/sendInvitation" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public int sendInvitation(InvitationVO invitationVO  , AlrmVO alrmVO){
        int division=this.projMemManageMentService.sendInvitation(invitationVO  );
        if(division==1){
            this.projMemManageMentService.insertAlrm(alrmVO);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/extractionParticipants" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public int extractionParticipants(ProjMemVO projMemVO){
        return this.projMemManageMentService.extractionParticipants(projMemVO);
    }
    @ResponseBody
    @RequestMapping(value = "/insertAlrm" , method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public int insertAlrm(AlrmVO alrmVO){
        return this.projMemManageMentService.insertAlrm(alrmVO);
    }

}

