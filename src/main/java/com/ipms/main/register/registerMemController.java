package com.ipms.main.register;

import com.ipms.main.register.service.MemService;
import com.ipms.main.vo.MemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
            return "redirect:/main/main";
        }else{
            return "redirect:/";
        }
    }
    
}
