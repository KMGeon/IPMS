package com.ipms.main;

import com.ipms.main.alert.vo.AlrmVO;
import com.ipms.proj.projMemManageMent.mapper.MemManageMapper;
import com.ipms.security.domain.CustomUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
	@Autowired
	MemManageMapper memManageMapper;

	@GetMapping("/page")
	public String hello(Authentication auth) {
		return "main/page";
	}

	@GetMapping("/test")
	public  String test(){
		return "test";
	}

	@ResponseBody
	@RequestMapping(value = "/boardList" ,method = RequestMethod.GET)
	public  List<AlrmVO> boardList1(){
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		log.info("userPrincipal: " +user.getMember().getMemCode());
		List<AlrmVO> list = this.memManageMapper.getAlrmList(user.getMember().getMemCode());
		return  list;
	}

}
