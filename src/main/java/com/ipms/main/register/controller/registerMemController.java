package com.ipms.main.register.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.register.service.MemService;
import com.ipms.main.register.vo.CommonCodeVO;
import com.ipms.main.register.vo.TechStackVO;
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
@RequestMapping(value = "/main")
public class registerMemController {
    @Autowired
    MemService memService;
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;

    //회원가입
    @RequestMapping(value = "/signUpForm", method = RequestMethod.GET)
    public String signUpFormGet(Model model) {
        List<CommonCodeVO> codeVOS = this.memService.techStack();
        model.addAttribute("list", codeVOS);
        return "main/login/signUpForm";
    }


    @RequestMapping(value = "/signUpForm", method = RequestMethod.POST)
    public String signUpForm(@ModelAttribute MemVO memVO
            , Authentication authentication
            , @ModelAttribute TechStackVO techStackVO) {
//        rawPw=memVO.getMemPasswd();
//        encodePw = bcryptPasswordEncoder.encode(rawPw);
//        memVO.setMemPasswd(encodePw);
        return this.memService.signUp(memVO, authentication, techStackVO);
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
