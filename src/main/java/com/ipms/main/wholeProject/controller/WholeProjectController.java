package com.ipms.main.wholeProject.controller;

import com.ipms.commons.pageHandler.Criteria;
import com.ipms.commons.pageHandler.PageDTO;
import com.ipms.commons.pageHandler.PageHandler;
import com.ipms.main.newProject.vo.ProjMemVO;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping(value = "/main", method = RequestMethod.GET)
public class WholeProjectController {

    @Autowired
    WholeProjectService wholeProjectService;

    @RequestMapping(value = "/wholeProject", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String wholeProject(Criteria criteria, Model model) {
        List<ProjVO> list = this.wholeProjectService.getListPage(criteria);
        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(criteria, 10));
        return "main/wholeProject/wholeProject";
    }

    @PreAuthorize("isAuthenticated() and ( hasAnyRole('ROLE_MEMBER'))")
    @RequestMapping(value = "/projectDetail/{projId}", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String projectDetail(@PathVariable("projId") String projId, Model model, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String test = this.wholeProjectService.getProjId(userDetails.getUsername()).toString();
        List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);

        model.addAttribute("detailList", detailList);
        return "main/wholeProject/projectDetail";
    }

    @RequestMapping(value = "/joinProject", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public int joinProject(ProjMemVO projMemVO) {
        int division = this.wholeProjectService.registrationApplication(projMemVO);
        return division;
    }
}
