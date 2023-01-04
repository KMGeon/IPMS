package com.ipms.main.mypage.inviteAndApply.controller;

import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.vo.InvitationVO;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ipms.main.login.controller.LoginController.getCustomUser;

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
    public String inviteOrApply() {
        return "main/mypage/inviteAndApply";
    }
    //신청한 프로젝트
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @GetMapping(value = "/projectsApplied")
    public List<ProjMemVO>projectsApplied(){
        CustomUser user = getCustomUser();
        List<ProjMemVO> projectsApplied = this.inviteAndApplyService.projectsApplied(user.getMember().getMemCode());
        return projectsApplied;
    }

    //신청한 회원
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @GetMapping(value = "/memberWhoApplied")
    public List<ProjMemVO>memberWhoApplied(){
        CustomUser user = getCustomUser();
        List<ProjMemVO> memberWhoApplied = this.inviteAndApplyService.memberWhoApplied(user.getMember().getMemCode());
        return memberWhoApplied;
    }
    //초대된 프로젝트
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @GetMapping(value = "/invitationWaitingList")
    public List<InvitationVO>invitationWaitingList(String projId){
        CustomUser user = getCustomUser();
        List<InvitationVO> invitationWaitingList = this.inviteAndApplyService.invitationWaitingList(user.getMember().getMemCode());
        return invitationWaitingList;
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
    public int acceptInvitation( @ModelAttribute ProjMemVO projMemVO ,@RequestParam(name = "projId") String projId) {
        CustomUser user = getCustomUser();
        log.info("================="+projId);
        projMemVO.setMemCode(user.getMember().getMemCode());
        projMemVO.setProjId(projId);
        if (this.inviteAndApplyService.invitationApproved(projMemVO) == 1) {
            this.inviteAndApplyService.invitedMemberApproval(projMemVO);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @PostMapping(value = "/refusalInvitation")
    @ResponseStatus(HttpStatus.CREATED)
    public int refusalInvitation(@ModelAttribute InvitationVO invitationVO) {
        return this.inviteAndApplyService.refusalInvitation(invitationVO);
    }


}
