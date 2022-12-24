package com.ipms.proj.dashboard.controller;

import com.ipms.main.mypage.mapper.MyPageMapper;
import com.ipms.main.newProject.vo.ProjVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

@Slf4j
@RequestMapping("/proj")
@Controller
public class DashboardController {
    @Autowired
    MyPageMapper myPageMapper;


    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/{projId}/dashboard")
    public String projMain(@PathVariable(name = "projId") String projId, Model model, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        List<ProjVO> list = this.myPageMapper.getCheckProjId(userDetails.getUsername());
        for (ProjVO proj : list) {
            if (proj.getProjId().equals(projId)) {
                model.addAttribute("projId", projId);
                return "proj/dashboard/dashboard";
            }
        }
        return "redirect:/main/page";
    }
}
