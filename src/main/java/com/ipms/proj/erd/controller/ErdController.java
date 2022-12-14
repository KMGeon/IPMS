package com.ipms.proj.erd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipms.proj.erd.service.ErdService;
import com.ipms.proj.erd.vo.ErdVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/proj")
@Controller
public class ErdController {

	@Autowired
	ErdService erdService;
	
	@GetMapping("/erd")
	public String erdGet(@RequestParam(required = false) Integer erdVer,Model model) {
		ErdVO erdVO = new ErdVO();
		if(erdVer == null) {
			erdVO = null;
		}else {
			erdVO.setErdVer((int)erdVer);
		}
		ErdVO erdData = erdService.selectErd(erdVO);
		List<ErdVO> listErdVer = erdService.selectVer(erdVO);
		model.addAttribute("erdData",erdData);
		model.addAttribute("listErdVer",listErdVer);
		return "proj/erd05";
	}
	
	@ResponseBody
	@PostMapping("/erdInsert")
	public String erdInsertPost(@RequestBody ErdVO erdVO) {
		log.info("erdVO: "+erdVO.toString());
		int result = erdService.insertErd(erdVO);
		String requist = "";
		if(result > 0) {
			requist = "성공";
		}else {
			requist = "실패";
		}
		
		return requist;
	}
	
	@ResponseBody
	@PostMapping("/erdVer")
	public List<ErdVO> erdVer(@RequestBody(required = false) ErdVO erdVO){
		List<ErdVO> result = erdService.selectVer(erdVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/erdUpdate")
	public String erdUpdate(@RequestBody ErdVO erdVO) {
		int result = erdService.erdUpdate(erdVO);
		String upadteResult = "";
		if(result > 0) {
			upadteResult ="성공";
		}else {
			upadteResult ="실패";
		}
		return upadteResult;
	}
	
	@ResponseBody
	@PostMapping("/erdDelete")
	public String erdDelete(@RequestBody ErdVO erdVO) {
		int result = erdService.erdDelete(erdVO);
		String upadteResult = "";
		if(result > 0) {
			upadteResult ="성공";
		}else {
			upadteResult ="실패";
		}
		return upadteResult;
		
	}
}
