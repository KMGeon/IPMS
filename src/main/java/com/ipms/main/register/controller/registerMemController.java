package com.ipms.main.register.controller;

import com.ipms.main.register.service.MemService;
import com.ipms.vo.MemberAuth;
import com.ipms.vo.MemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
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
    @RequestMapping(value = "/signUpForm" , method = RequestMethod.GET)
    public String signUpFormGet(MemVO m){
        return "main/login/signUpForm";
    }

    //회원가입post
    @PreAuthorize("permitAll()")
    @RequestMapping(value = "/signUpForm" , method = RequestMethod.POST)
    public String signUpForm(@ModelAttribute MemVO memVO )
    {
        String rawPw="";
        String encodePw="";

//        rawPw=memVO.getMemPasswd();
//        encodePw = bcryptPasswordEncoder.encode(rawPw);
//        memVO.setMemPasswd(encodePw);
        int result = this.memService.registerMember(memVO);
        log.info("result::"+result);
        if(result==1){
            List<MemberAuth>list = memVO.getMemAuthList();
            for(MemberAuth authVO : list){
                if(authVO.getMemAuth()!=null){
                    MemberAuth memberAuth = new MemberAuth();
                    memberAuth.setMemCode(memVO.getMemCode());
                    memberAuth.setMemAuth(authVO.getMemAuth());
                    this.memService.authInsert(memberAuth);
                }
            }
            log.info("============================="+result);
            return "redirect:/main/page";
        }else{
            return "redirect:/main/page";
        }
    }
    @GetMapping("/memRegisterCheck")
    public @ResponseBody int registerCheck(@RequestParam String memEmail){
        int result = this.memService.registerCheck(memEmail);
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
