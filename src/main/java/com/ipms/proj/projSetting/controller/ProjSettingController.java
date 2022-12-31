package com.ipms.proj.projSetting.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.projSetting.reCaptcha.VerifyReCapcha;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ProjSettingController {
	
	@GetMapping("/{projId}/settingManagement")
	public String setProj(@PathVariable String projId) {
		return "proj/projSetting/settingManagement";
	}
	
	@ResponseBody
	@RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		
		// 시크릿 키를 캡챠를 받아올수 있는 Class에 보내서 그곳에서 값을 출력한다
		VerifyReCapcha.setSecretKey("6LdMkrYjAAAAAHaxLoHA7pqQ0Vcs3w5WS5wEzd5W");
		
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    
	    try {
	    	
	       if(VerifyReCapcha.verify(gRecaptchaResponse))
	        
	    	   return 0; // 성공
	       
	       else return 1; // 실패
	       
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        return -1; //에러
	    }
	}
	
}
