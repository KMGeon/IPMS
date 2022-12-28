package com.ipms.main.newProject.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.service.NewProjectService;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;

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
    public String newProjectPost(@ModelAttribute ProjVO projVO, @ModelAttribute MemVO memVO, Authentication authentication) {
        return this.newProjectService.projectCreate(projVO, memVO, authentication);
    }

    @PreAuthorize("permitAll()")
    @RequestMapping(value = "fileupload1" , method = RequestMethod.POST)
    public String requestupload1(MultipartHttpServletRequest mRequest) {
        String src = mRequest.getParameter("src");
        MultipartFile mf = mRequest.getFile("file");

        String path = "E:\\IdeaProjects\\ipms\\src\\main\\webapp\\resources\\upload\\img\\";

        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
        long fileSize = mf.getSize(); // 파일 사이즈

        System.out.println("originFileName : " + originFileName);
        System.out.println("fileSize : " + fileSize);

        String safeFile = path + originFileName;
        try {
            mf.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
        return "redirect:/main/page";
    }
}
