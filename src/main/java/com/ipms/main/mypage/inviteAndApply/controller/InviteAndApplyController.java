package com.ipms.main.mypage.inviteAndApply.controller;

import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/main")
@Slf4j
@Controller
public class InviteAndApplyController {
    @Autowired
    InviteAndApplyService inviteAndApplyService;
    @Autowired
    MyPageMapper myPageMapper;

    @GetMapping(value = "/inviteAndApply")
    @ResponseStatus(HttpStatus.OK)
    public String inviteOrApply(Model model, Authentication authentication, ProjMemVO projMemVO) {
        return this.inviteAndApplyService.inviteOrApply(model, authentication, projMemVO);
    }


    //신청한 회원
    @ResponseBody
    @PostMapping(value = "/approval")
    @ResponseStatus(HttpStatus.CREATED)
    public  List<ProjMemVO> memberWhoApplied(Authentication authentication, ProjMemVO projMemVO) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjMemVO> memberWhoApplied = this.inviteAndApplyService.memberWhoApplied(this.myPageMapper.getMemCode(userDetails.getUsername()));
        return memberWhoApplied;
    }

// 신청한 회원-프로젝트 승인(신청한 회원)
    @ResponseBody
    @PostMapping(value = "/approveProject")
    @ResponseStatus(HttpStatus.CREATED)
    public int approveProject(Authentication authentication, ProjMemVO projMemVO) {
        return this.inviteAndApplyService.approval(projMemVO);
    }

    //신청한 회원-프로젝트 취소(신청한 회원)
    @ResponseBody
    @PostMapping(value = "/projectCompanionship")
    @ResponseStatus(HttpStatus.CREATED)
    public int projectCompanionship(Authentication authentication, ProjMemVO projMemVO) {
        return this.inviteAndApplyService.companionProject(projMemVO);
    }

    //초대된 프로젝트 수락
    @ResponseBody
    @PostMapping(value = "/acceptInvitation")
    @ResponseStatus(HttpStatus.CREATED)
    public int acceptInvitation(Authentication authentication,
                                @ModelAttribute ProjMemVO projMemVO) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        projMemVO.setMemCode(this.myPageMapper.getMemCode(userDetails.getUsername()));
        if (this.inviteAndApplyService.invitationApproved(projMemVO) == 1) {
            this.inviteAndApplyService.invitedMemberApproval(projMemVO);
            return 1;
        }
        return 0;
    }    //초대된 프로젝트 거절

    @ResponseBody
    @PostMapping(value = "/refusalInvitation")
    @ResponseStatus(HttpStatus.CREATED)
    public int refusalInvitation(@ModelAttribute InvitationVO invitationVO) {
        return this.inviteAndApplyService.refusalInvitation(invitationVO);
    }


}
