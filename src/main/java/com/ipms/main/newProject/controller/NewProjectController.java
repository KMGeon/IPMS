package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RequestMapping(value = "/main")
@Controller
public class NewProjectController {

    @Autowired
    NewProjectService newProjectService;
    @Autowired
    MyPageMapper myPageMapper;

    //프로젝트 생성
    @RequestMapping(value = "/newProjectForm", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.CREATED)
    public String newProject() {
        return "main/newProject/newProjectForm";
    }

    /*
     * 프로젝트 생성 -> 프로젝트 팀 구성 -> 프로젝트 멤버 생성
     */
    @RequestMapping(value = "/newProjectPost", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String projectCreate(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication, MultipartFile[] uploadFile) {
        return this.newProjectService.projectCreate(projVO, memVO, authentication,uploadFile);
    }

}
