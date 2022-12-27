package com.ipms.main.mypage.inviteAndApply.controller;

import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/main")
@Slf4j
@Controller
public class InviteAndApplyController {
    @Autowired
    InviteAndApplyService inviteAndApplyService;
    @Autowired
    MyPageMapper myPageMapper;

    @RequestMapping(value = "/inviteAndApply", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String inviteOrApply(Model model, Authentication authentication, ProjMemVO projMemVO) {
        return this.inviteAndApplyService.inviteOrApply(model, authentication, projMemVO);
    }


    //신청한 회원-프로젝트 승인(신청한 회원)
    @RequestMapping(value = "/approveProject", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int approveProject(Authentication authentication, ProjMemVO projMemVO, RedirectAttributes rttr) {
        return this.inviteAndApplyService.approval(projMemVO);
    }

    //신청한 회원-프로젝트 취소(신청한 회원)
    @RequestMapping(value = "/projectCompanionship", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int projectCompanionship(Authentication authentication, ProjMemVO projMemVO, RedirectAttributes rttr) {
        return this.inviteAndApplyService.companionProject(projMemVO);
    }

    //초대된 프로젝트 수락
    @RequestMapping(value = "/acceptInvitation", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int acceptInvitation(Authentication authentication, @ModelAttribute ProjMemVO projMemVO) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        projMemVO.setMemCode(this.myPageMapper.getMemCode(userDetails.getUsername()));
        if(this.inviteAndApplyService.acceptInvitation(projMemVO) == 1){
            this.inviteAndApplyService.acceptInviteAndDelete(projMemVO);
        }
        return this.inviteAndApplyService.acceptInvitationProcess(projMemVO);
    }

    //초대된 프로젝트 거절
    @RequestMapping(value = "/refusalInvitation", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int refusalInvitation(Authentication authentication, ProjMemVO projMemVO) {
        return this.inviteAndApplyService.refusalInvitation(projMemVO);
    }
}
