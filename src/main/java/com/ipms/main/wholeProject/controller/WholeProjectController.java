package com.ipms.main.wholeProject.controller;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequestMapping(value = "/main" , method = RequestMethod.GET)
public class WholeProjectController {

    @Autowired
    WholeProjectService wholeProjectService;

    @RequestMapping(value = "/wholeProject" , method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String wholeProject(Model model){
        List<ProjVO> list = this.wholeProjectService.listProj();
        model.addAttribute("list" , list);
        return "main/wholeProject/wholeProject";
    }

    @RequestMapping(value = "/projectDetail/{projId}" , method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK )
    public  String projectDetail(@PathVariable("projId") String projId ,Model model ){
        List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);
        model.addAttribute("detailList",detailList);
        return "main/wholeProject/projectDetail";
    }

}
