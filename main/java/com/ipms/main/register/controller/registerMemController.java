package com.ipms.main.register.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.register.service.MemService;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/main")
public class registerMemController {

    private MemService memService;
    public static final String VIEW_REDIRECT_OK = "success";

    @Autowired
    public registerMemController(MemService memService) {
        this.memService = memService;
    }

    @GetMapping(value = "/signUpForm")
    public String signUpFormGet(Model model) {
        List<CommonCodeVO> codeVOS = this.memService.techStack();
        model.addAttribute("list", codeVOS);
        return "main/login/signUpForm";
    }

    @PostMapping(value = "/signUpForm")
    public String signUpForm(@ModelAttribute MemVO memVO, Authentication authentication, @ModelAttribute TechStackVO techStackVO) {
        String signUp = this.memService.signUp(memVO, authentication, techStackVO);
        if (signUp.equals(VIEW_REDIRECT_OK)) return "main/page";
        else return "redirect:/main/signUpForm";
    }

    @PostMapping("/memRegisterCheck")
    @ResponseBody
    public int registerCheck(@RequestParam String memEmail) {
        return this.memService.registerCheck(memEmail);
    }

    @PostMapping(value = "/UpdatePwd")
    public String UpdatePwd(@ModelAttribute MemVO memVO) {

        if (this.memService.UpdatePwd(memVO) == 1) {
            return "main/page";
        }
        return "redirect:/main/loginForm";

    }

}
