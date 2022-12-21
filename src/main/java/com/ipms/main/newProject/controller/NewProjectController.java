package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;

@Slf4j
@RequestMapping(value = "/main")
@Controller
public class NewProjectController {

    @Autowired
    NewProjectService newProjectService;

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
    public String newProjectPost(@ModelAttribute ProjVO projVO,
                                 @ModelAttribute MemVO memVO,
                                 @ModelAttribute ProjTeamVO projTeamVO,
                                 @RequestParam String teamId,
                                 @RequestParam String memCode) {
        return this.newProjectService.projectCreate(projVO, memVO, projTeamVO, teamId, memCode);
    }

    @RequestMapping(value = "/uploadFormAction", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public String uploadFormPost(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model) {
        String uploadFolder = "C:\\upload";
        for (MultipartFile multipartFile : uploadFile) {
            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }
        return "main/loginForm";
    }


}
