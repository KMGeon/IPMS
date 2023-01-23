package com.ipms.main.wholeProject.controller;

import com.ipms.commons.vo.Criteria;
import com.ipms.commons.vo.PageVO;
import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.wholeProject.service.WholeProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@Slf4j
@RequestMapping(value = "/main", method = RequestMethod.GET)
public class WholeProjectController {

    @Autowired
    WholeProjectService wholeProjectService;
    @Autowired
    MyPageMapper myPageMapper;

    @GetMapping(value = "/wholeProject")
    public String wholeProject(Model model, Criteria cri) {
        model.addAttribute("list", wholeProjectService.getListPage(cri));
        model.addAttribute("pageMaker", new PageVO(cri, this.wholeProjectService.getWholeProjectTotal(cri)));
        return "main/wholeProject/wholeProject";
    }

}
