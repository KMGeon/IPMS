package com.ipms.main.register.controller;

import com.ipms.main.login.vo.MemVO;
import com.ipms.main.register.service.MemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public String signUpFormGet() {
        return "main/login/signUpForm";
    }


    @RequestMapping(value = "/signUpForm", method = RequestMethod.POST)
    public String signUpForm(@ModelAttribute MemVO memVO) {
//        rawPw=memVO.getMemPasswd();
//        encodePw = bcryptPasswordEncoder.encode(rawPw);
//        memVO.setMemPasswd(encodePw);
        return this.memService.signUp(memVO);
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
        } else {
            return "redirect:/main/loginForm";
        }
    }


}
