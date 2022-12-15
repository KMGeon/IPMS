package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.login.vo.MemberAuth;
import com.ipms.main.newProject.service.NewProjectService;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjTeamVO;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
    @RequestMapping(value = "/newProjectForm" , method = RequestMethod.GET)
    public String newProject(){
        return "main/newProject/newProjectForm";
    }


     /**
      프로젝트 생성 -> 프로젝트 팀 구성 -> 프로젝트 멤버 생성
     * @param projVO
     * @param memVO
     * @param projTeamVO
     * @param teamId
     * @param memCode
     * @return
     */
    @RequestMapping(value = "/newProjectPost", method = RequestMethod.POST)
    public String newProjectPost(@ModelAttribute ProjVO projVO,
                                 @ModelAttribute MemVO memVO,
                                 @ModelAttribute ProjTeamVO projTeamVO,
                                 @RequestParam String teamId,
                                 @RequestParam String memCode)
    {
        //프로젝트 생성
        int result = this.newProjectService.projInsert(projVO);
        if(result==1){
            // 프로젝트 생성 -> 프로젝트 팀 생성
            projTeamVO.setProjId(projVO.getProjId());
           this.newProjectService.insertProTeam(projTeamVO);

            //프로젝트 생성 -> 프로젝트 팀 생성 -> 프로젝트 멤버 생성
            ProjMemVO vo = new ProjMemVO();
            vo.setProjId(projTeamVO.getProjId());
            vo.setMemCode(memCode);
            vo.setTeamId(teamId);
            this.newProjectService.insertProjMem(vo);
            log.info("memCode"+memCode);
            this.newProjectService.authDelete(memCode);

            //권한부여 ROLE_MEMBER , ROLE_PROJECT_LEADER
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
        }else{
            return "main/page";
        }
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
        return  "main/loginForm";
    }


}
