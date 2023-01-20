package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import static com.ipms.main.register.controller.registerMemController.VIEW_REDIRECT_OK;

@Slf4j
@RequestMapping(value = "/main")
@Controller
public class NewProjectController {
    @Autowired
    NewProjectService newProjectService;

    //프로젝트 생성
    @GetMapping(value = "/newProjectForm")
    public String newProject() {
        return "main/newProject/newProjectForm";
    }

    //프로젝트 생성 -> 프로젝트 팀 구성 -> 프로젝트 멤버 생성
    @PostMapping(value = "/newProjectPost")
    public String projectCreate(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication, MultipartFile[] uploadFile) {
        String result = this.newProjectService.projectCreate(projVO, memVO, authentication, uploadFile);
        if (result.equals(VIEW_REDIRECT_OK)) {
            return "redirect:/main/wholeProject";
        }
        return "main/page";
    }
}
