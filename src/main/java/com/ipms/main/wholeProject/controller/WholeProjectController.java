package com.ipms.main.wholeProject.controller;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@Slf4j
@RequestMapping(value = "/main" , method = RequestMethod.GET)
public class WholeProjectController {

    @Autowired
    WholeProjectService wholeProjectService;

    @RequestMapping(value = "/wholeProject" , method = RequestMethod.GET)
    public String wholeProject(Model model){
        List<ProjVO> list = this.wholeProjectService.listProj();
        model.addAttribute("list" , list);
        return "main/wholeProject/wholeProject";
    }

    @RequestMapping(value = "/projectDetail/{projID}" , method = RequestMethod.GET)
    public String projectDetail(@PathVariable String projID){
        return "main/wholeProject/projectDetail";
    }

}
