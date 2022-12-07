package com.ipms.main.wholeProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/main")
@Controller
public class WholeProjectController {
    @RequestMapping(value = "/wholeProject",method = RequestMethod.GET)
    public String wholeProject(){
        return "main/wholeProject/wholeProject";
    }
}
