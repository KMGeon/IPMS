package com.ipms.main.main.controller;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.main.main.service.MainService;
import com.ipms.main.mypage.ongoingProject.service.OnGoingProjectService;
import com.ipms.main.mypage.projectbookmark.service.ProjectBookMarkService;
import com.ipms.main.mypage.projectbookmark.vo.BookMarkVO;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.proj.projMemManageMent.mapper.MemManageMapper;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
    @Autowired
    MemManageMapper memManageMapper;

    @Autowired
    ProjectBookMarkService bookmarkservice;

    @Autowired
    OnGoingProjectService onGoingProjectService;
    @Autowired
    MainService mainService;

    @GetMapping("/page")
    public String hello(Authentication auth, Model model) {
        if (auth != null) {
            auth = SecurityContextHolder.getContext().getAuthentication();
            CustomUser user = (CustomUser) auth.getPrincipal();
            String memCode = user.getMember().getMemCode();

            List<BookMarkVO> bookMarkList = bookmarkservice.selectBookMark(memCode);
            List<ProjMemVO> projList = this.onGoingProjectService.goingProjects(memCode);
            model.addAttribute("bookMarkList", bookMarkList);
            model.addAttribute("projList", projList);
        }
        return "main/page";
    }

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @ResponseBody
    @RequestMapping(value = "/boardList", method = RequestMethod.GET)
    public List<AlrmVO> boardList1() throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = null;
        try {
            user = (CustomUser) authentication.getPrincipal();
            List<AlrmVO> list = this.memManageMapper.getAlrmList(user.getMember().getMemCode());
            return list;
        } catch (Exception ex) {
            log.info("erw" + ex.getMessage());
            throw new Exception(ex.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/countAlrm", method = RequestMethod.GET)
    public String countAlrm() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = (CustomUser) authentication.getPrincipal();
        return String.valueOf(this.mainService.countAlrm(user.getMember().getMemCode()));
    }

    @ResponseBody
    @RequestMapping(value = "/deleteAlrm", method = RequestMethod.POST)
    public int deleteAlrm(AlrmVO alrmVO) {
        return this.memManageMapper.deleteAlrm(alrmVO);
    }

    @ResponseBody
    @RequestMapping(value = "/countAlrm", method = RequestMethod.POST)
    public int countAlrm(AlrmVO alrmVO) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = (CustomUser) authentication.getPrincipal();
        return this.memManageMapper.countAlrm(user.getMember().getMemCode());
    }
}
