package com.ipms.proj.projQuit.controller;

import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.proj.projQuit.service.ProjQuitService;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ProjQuitController {
    @Autowired
    ProjQuitService projQuitService;

    @RequestMapping(value = "/{projId}/projQuit", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String QuitPage(@PathVariable(name = "projId") String projId) {
        return "proj/projQuit/projQuit";
    }

    @RequestMapping(value = "{projId}/projQuitProcess", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public String projQuit(@ModelAttribute ProjVO projVO , @PathVariable(name = "projId")String projId) {
        Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
        CustomUser user = (CustomUser) authentication.getPrincipal();
        projVO.setMemCode(user.getMember().getMemCode());
        projVO.setProjId(projId);
        log.info("---------------------------------",projId);
        log.info("============================",projVO);
        int division = this.projQuitService.dropApplication(projVO);
        if (division == 1) {
            return "main/page";
        }
        return "main/page";
    }
}
