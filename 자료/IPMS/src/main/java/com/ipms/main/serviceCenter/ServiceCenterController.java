package com.ipms.main.serviceCenter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
@RequestMapping(value = "/main" )
public class ServiceCenterController {

    @RequestMapping(value = "/svcNotice" , method = RequestMethod.GET)
    public String svcNotice(){
        return "main/serviceCenter/svcNotice";
    }

    @RequestMapping(value = "/svcFaq" , method = RequestMethod.GET)
    public String svcFaq(){
        return "main/serviceCenter/svcFaq";
    }

}
