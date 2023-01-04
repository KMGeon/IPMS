package com.ipms.main.admin.techStackManagement.controller;

import com.ipms.main.admin.techStackManagement.service.TechStackService;
import com.ipms.main.admin.techStackManagement.vo.TechStackVO;
import com.ipms.main.register.service.MemService;
import com.ipms.main.register.vo.CommonCodeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@RequestMapping("/main")
@Controller
public class TechStackController {
    @Autowired
    MemService memService;
    @Autowired
    TechStackService techStackService;

    @GetMapping(value = "/techStackManager")
    public String techStackManager(Model model) {
        List<CommonCodeVO> codeVOS = this.memService.techStack();
        model.addAttribute("list", codeVOS);
        return "main/admin/techStackManager";
    }

    @ResponseBody
    @PostMapping(value = "/addSkillStack")
    public int addSkillStack(TechStackVO techStackVO) {
        return this.techStackService.addSkillStack(techStackVO);
    }

   @ResponseBody
    @PostMapping(value = "/clearSkillStack")
    public int clearSkillStack(String commonCodeValue) {
        return this.techStackService.clearSkillStack(commonCodeValue);
    }


}