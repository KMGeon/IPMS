package com.ipms.proj.projMemManageMent.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projMemManageMent.service.ProjMemManageMentService;
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
        log.info("중요한 데이터======================================"+vo.toString());
        model.addAttribute("dropMemList",this.projMemManageMentService.dropSupportPersonnel(vo));
        model.addAttribute("ProjectParticipantsMem",this.projMemManageMentService.projectPersonnelInquiry(vo));
        model.addAttribute("projectInvitationList",this.projMemManageMentService.projectInvitationList(vo));
        return "proj/memmanagement/projMemberManagement";
    }

    @RequestMapping(value = "/dropMemListProcessing", method = RequestMethod.POST)
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public int dropMemListProcessing(MemVO memVO) {
        return this.dropMemListProcessing(memVO);
    }

//    @RequestMapping(value = "/inviteBtnProcess", method = RequestMethod.POST)
//    @ResponseBody
//    @ResponseStatus(HttpStatus.OK)
//    public int invitationRequestButton(ProjVO projVO) {
//        return this.projMemManageMentService.invitationRequestButton(projVO);
//    }
}

