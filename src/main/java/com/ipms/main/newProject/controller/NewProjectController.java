package com.ipms.main.newProject.controller;

import com.ipms.main.newProject.service.NewProjectService;

import com.ipms.vo.MemberAuth;
import com.ipms.vo.ProjMemVO;
import com.ipms.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.ArrayList;
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
     * 프로젝트 생성POST
     * @param projVO
     * @return
     */
    @RequestMapping(value = "/newProjectPost", method = RequestMethod.POST)
    public String newProjectPost(@ModelAttribute  ProjVO projVO , @RequestParam String memEmail){
        log.info("memEmail=="+memEmail);
        int result = this.newProjectService.projInsert(projVO);
        if(result==1){
            List<ProjMemVO> projMemVOList = projVO.getProjMemVOList();
            List<ProjMemVO> projMemVOList2 = new ArrayList<ProjMemVO>();
            for(ProjMemVO proj : projMemVOList){
                if(proj.getMemCode()!=null){
                    log.info("projmemCode===="+proj.getMemCode());
                    log.info("projID===="+proj.getProjId());
                    //ProjMemVO projMemVO = new ProjMemVO();
                    proj.setMemCode(projVO.getMemCode());
                    proj.setProjId(proj.getProjId());
                    projMemVOList2.add(proj);

                }
            }

            this.newProjectService.insertProjMem(projMemVOList2);

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
