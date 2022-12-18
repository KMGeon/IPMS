package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.service.NewProjectService;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

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
    public String newProjectPost(@ModelAttribute ProjVO projVO,
                                 @ModelAttribute MemVO memVO,
                                 @ModelAttribute ProjTeamVO projTeamVO,
                                 @RequestParam String teamId,
                                 @RequestParam String memCode) {
        //프로젝트 생성
        int sortation = this.newProjectService.projInsert(projVO);
        if (sortation == 1) {
            // 프로젝트 생성 -> 프로젝트 팀 생성
            projTeamVO.setProjId(projVO.getProjId());
            this.newProjectService.insertProTeam(projTeamVO);
            log.info(projTeamVO.toString());

            //프로젝트 생성 -> 프로젝트 팀 생성 -> 프로젝트 멤버 생성
            ProjMemVO vo = ProjMemVO.builder()
                    .projId(projTeamVO.getProjId())
                    .memCode(memCode)
                    .teamId(teamId).build();
            this.newProjectService.insertProjMem(vo);

            //권한부여 ROLE_MEMBER , ROLE_PROJECT_LEADER
            this.newProjectService.authDelete(memCode);
            List<MemberAuth> list = memVO.getMemAuthList();
            for(MemberAuth authVO : list){
                if(authVO.getMemAuth()!=null){
                    MemberAuth memberAuth = new MemberAuth();
                    memberAuth.setMemCode(memCode);
                    memberAuth.setProjId(projTeamVO.getProjId());
                    memberAuth.setMemAuth(authVO.getMemAuth());
                    this.newProjectService.projAuthInsert(memberAuth);
                }
            }
            return "main/page";
        }
        return "main/loginFrom";

    }

    /**
     * @param uploadFile
     * @param model
     * @return
     */
    @RequestMapping(value = "/uploadFormAction", method = RequestMethod.POST)
    public String uploadFormPost(@RequestParam("uploadFile") MultipartFile[] uploadFile, Model model) {

        String uploadFolder = "C:\\upload";

        for (MultipartFile multipartFile : uploadFile) {
            log.info("-------------------------------------");
            log.info("Upload File Name: " + multipartFile.getOriginalFilename());
            log.info("Upload File Size: " + multipartFile.getSize());
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
