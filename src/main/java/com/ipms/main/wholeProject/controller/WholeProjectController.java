package com.ipms.main.wholeProject.controller;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequestMapping(value = "/main", method = RequestMethod.GET)
public class WholeProjectController {

    @Autowired
    WholeProjectService wholeProjectService;
    @Autowired
    MyPageMapper myPageMapper;

    @GetMapping(value = "/wholeProject")
    @ResponseStatus(value = HttpStatus.OK)
    public String wholeProject(Model model , Criteria cri) {
        model.addAttribute("list",wholeProjectService.getListPage(cri));
        model.addAttribute("pageMaker",new PageVO(cri,this.wholeProjectService.getWholeProjectTotal()));
        return "main/wholeProject/wholeProject";
    }

    @PreAuthorize("isAuthenticated() and ( hasAnyRole('ROLE_MEMBER'))")
    @RequestMapping(value = "/projectDetail/{projId}", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    public String projectDetail(@PathVariable("projId") String projId, Model model, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String memCode = myPageMapper.getMemCode(userDetails.getUsername());
        ProjVO vo = new ProjVO();
        vo.setProjId(projId);
        vo.setMemCode(memCode);
        List<ProjVO> detailList = this.wholeProjectService.detailPage(projId);
        List<ProjVO> checkMyProject = this.wholeProjectService.checkMyProject(projId);
        List<ProjVO> test = this.wholeProjectService.checkMyProject2(vo);
        model.addAttribute("detailList", detailList);
        model.addAttribute("check", checkMyProject);
        model.addAttribute("check2", test);
        return "main/wholeProject/projectDetail";
    }

    @RequestMapping(value = "/joinProject", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public int joinProject(ProjVO projVO, Authentication authentication) {
        return this.wholeProjectService.joinProjectProcess(projVO , authentication);
    }
}
