package com.ipms.main.newProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/main" , method = RequestMethod.GET)
@Controller
public class NewProjectController {
    @RequestMapping(value = "/newProjectForm" , method = RequestMethod.GET)
    public String newProject(){
        return "main/newProject/newProjectForm";
    }
}
