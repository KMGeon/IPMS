package com.ipms.main.mypage.inviteAndApply.controller;

import com.ipms.main.mypage.inviteAndApply.service.InviteAndApplyService;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.register.service.MemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@RequestMapping("/main")
@Slf4j
@Controller
public class InviteAndApplyController {
    @Autowired
    InviteAndApplyService inviteAndApplyService;
    @Autowired
    MemService memService;
    @Autowired
    NewProjectService newProjectService;

    @RequestMapping(value = "/inviteAndApply", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String inviteOrApply(Model model, Authentication authentication, ProjMemVO projMemVO) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String memCode = this.inviteAndApplyService.getMemCode(userDetails.getUsername());
        List<ProjMemVO> memberWhoApplied = this.inviteAndApplyService.memberWhoApplied(memCode);
        List<ProjMemVO> projectsApplied = this.inviteAndApplyService.projectsApplied(memCode);
        model.addAttribute("memberWhoApplied", memberWhoApplied);
        model.addAttribute("projectsApplied", projectsApplied);
        return "main/mypage/inviteAndApply";
    }


    //프로젝트 승인(신청한 회원)
    @RequestMapping(value = "/approveProject", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int approveProject(Authentication authentication, ProjMemVO projMemVO, RedirectAttributes rttr) {
        return this.inviteAndApplyService.approval(projMemVO);
    }

    //프로젝트 취소(신청한 회원)
    @RequestMapping(value = "/projectCompanionship", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public int projectCompanionship(Authentication authentication, ProjMemVO projMemVO, RedirectAttributes rttr) {
        return this.inviteAndApplyService.companionProject(projMemVO);
    }
}
