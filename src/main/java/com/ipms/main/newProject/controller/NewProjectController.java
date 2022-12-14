package com.ipms.main.newProject.controller;

import com.ipms.main.newProject.service.NewProjectService;

import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @PreAuthorize("hasRole('ROLE_MEMBER')")
    @RequestMapping(value = "/newProjectForm" , method = RequestMethod.GET)
    public String newProject(){
        return "main/newProject/newProjectForm";
    }


    /**
     * @param projVO
     * @param projMemVO
     * @param memEmail
     * @param memCode
     * @return
     */
    @RequestMapping(value = "/newProjectPost", method = RequestMethod.POST)
    public String newProjectPost(@ModelAttribute ProjVO projVO,
                                 @ModelAttribute ProjMemVO projMemVO ,
                                 @RequestParam String memEmail,
                                 @RequestParam String memCode)
    {
        int result = this.newProjectService.projInsert(projVO);
        log.info("==================RESULT================"+result);
        if(result==1){
            ProjMemVO vo = new ProjMemVO();
            vo.setProjId(projVO.getProjId());
            vo.setMemCode(memCode);
            log.info("projectId:"+vo.getProjId());
            log.info("memCode:"+vo.getMemCode());
            int result2 = this.newProjectService.insertProjMem(vo);
            log.info("result2:"+result2);
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

        String uploadFolder = "E:\\testUpload";

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
