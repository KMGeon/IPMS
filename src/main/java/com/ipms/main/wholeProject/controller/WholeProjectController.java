package com.ipms.main.wholeProject.controller;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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


    @RequestMapping(value = "/joinProject", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public int joinProject(ProjVO projVO, Authentication authentication) {
        return this.wholeProjectService.joinProjectProcess(projVO , authentication);
    }
}
