package com.ipms.main.register.controller;

import com.ipms.main.register.service.MemService;
import com.ipms.main.vo.MemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class registerMemController {
    @Autowired
    MemService memService;
    //회원가입
    @RequestMapping(value = "/signUpForm" , method = RequestMethod.GET)
    public String signUpFormGet(){
        return "main/login/signUpForm";
    }

    //회원가입post
    @PreAuthorize("permitAll()")
    @RequestMapping(value = "/signUpForm" , method = RequestMethod.POST)
    public String signUpForm(@ModelAttribute MemVO memVO)
    {
        log.info("memvo:::::"+memVO.toString());
        log.info("memvo:::::"+memVO.getMemNum());
        log.info("memvo:::::"+memVO.getEmail());
        log.info("memvo:::::"+memVO.getPaswd());
        int result = this.memService.registerMember(memVO);
        log.info("result::"+result);
        if(result==1){
            log.info("============================="+result);
            return "redirect:/main/page";
        }else{
            return "redirect:/main/page";
        }
    }
    @GetMapping("/memRegisterCheck")
    public @ResponseBody int registerCheck(@RequestParam String email){
        int result = this.memService.registerCheck(email);
        log.info("중복체크:::"+result);
        return result;
    }
    @PostMapping(value = "/UpdatePwd")
    public String UpdatePwd( @ModelAttribute  MemVO memVO){
        int result = this.memService.UpdatePwd(memVO);
        if(result==1){
            return "main/page";
        }else{
            return "redirect:/main/loginForm";
        }
    }


}
