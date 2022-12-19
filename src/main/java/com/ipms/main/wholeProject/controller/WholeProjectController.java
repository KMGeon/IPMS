package com.ipms.main.wholeProject.controller;

import com.ipms.commons.pageHandler.PageHandler;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    public String wholeProject(Integer page, Integer pageSize, Model model) {
//        if (page == null) {
//            page = 1;
//        }
//        if (pageSize == null) {
//            pageSize = 9;
//        }
//        int totalCnt = wholeProjectService.count();
//        PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
//        Map map = new HashMap();
//        map.put("offset", page + pageSize);
//        map.put("pageSize", pageSize+pageSize);
        List<ProjVO> list = this.wholeProjectService.listProj();
        model.addAttribute("list", list);
//        model.addAttribute("ph",pageHandler);
        return "main/wholeProject/wholeProject";
    }

    //    @PreAuthorize("hasRole(ROLE_MEMBER)")
    @RequestMapping(value = "/projectDetail/{projId}", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String projectDetail(@PathVariable("projId") String projId, Model model, Authentication authentication,
                                HttpServletResponse response) throws IOException {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjVO> test = this.wholeProjectService.getProjId(userDetails.getUsername());
        for (ProjVO proj : test) {
            log.info("projectId :" + proj.getProjId());
            log.info("projId:::" + projId);
            if (proj.getProjId().equals(projId)) {
                List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);
                model.addAttribute("detailList", detailList);
                return "main/wholeProject/projectDetail";
            }
        }
        response.sendRedirect("/main/page");
        return null;
    }

}
